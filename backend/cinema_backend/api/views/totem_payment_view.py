from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from rest_framework.permissions import AllowAny
from rest_framework import status
from api.utils import RawSQLHelper
import json

class TotemPaymentView(ViewSet):
    """
    Registers a sale for a session, handling tickets and payments.
    """
    permission_classes = [AllowAny]

    def create(self, request):

        data = request.data
        cpf = request.data.get("cpf")
        session_id = request.data.get("sala_id")
        tickets = request.data.get("poltronas", [])
        payment_method = request.data.get("forma_pagamento")

        if not session_id or not tickets:
            return Response({"error": "Session ID and selected seats are required."}, status=status.HTTP_400_BAD_REQUEST)

        tickets = json.loads(tickets)


        session_query = "SELECT numero FROM sessao WHERE numero = %s"
        session_result = RawSQLHelper.execute_query(session_query, [session_id])

        if not session_result:
            return Response({"error": "Sessão não encontrada."}, status=404)


        points_balance = 0
        if cpf:
            points_query = """
            SELECT SUM(qtde) AS total_pontos
            FROM pontos
            WHERE cliente_id = %s
            """

            points_result = RawSQLHelper.execute_query(points_query, [cpf])
            points_balance = points_result[0]["total_pontos"] if points_result else 0

        total_cost = 0
        only_points = True

        for ticket in tickets:
            ticket_type = ticket.get("tipo")
            ticket_value = ticket.get("valor")

            # if not ticket_type or ticket_value is None:
            #     return Response(
            #         {"error": "Cada poltrona deve conter o tipo e o valor do ingresso."},
            #         status=status.HTTP_400_BAD_REQUEST
            #     )

            if ticket_type != "pontos":
                only_points = False

            total_cost += ticket_value


            if only_points and payment_method != "pontos":
                return Response(
                {"error": "A forma de pagamento deve ser 'pontos' ao usar apenas ingressos por pontos."},
                status=status.HTTP_400_BAD_REQUEST
            )

            if only_points and points_balance < total_cost:
              return Response(
                {"error": "Saldo de pontos insuficiente."},
                status=status.HTTP_400_BAD_REQUEST
            )

            try:
                for ticket in tickets:
                    ticket_type = ticket.get("tipo")
                    ticket_value = ticket.get("valor")
                    poltrona_id = ticket.get("poltrona_id")

                    ingresso_query = """
                    INSERT INTO ingresso (tipo, valor, data, hora, forma_pagamento, cliente_id)
                    VALUES (%s, %s, CURRENT_DATE, CURRENT_TIME, %s, %s)
                    RETURNING id
                    """
                    ingresso_result = RawSQLHelper.execute_query(ingresso_query, [ticket_type, ticket_value, payment_method, cpf])

                    ingresso_id = ingresso_result[0]["id"]


                    pertence_query = """
                    INSERT INTO pertence (ingresso_id, sessao_n, poltrona_n, poltrona_l, sala_id)
                    VALUES (%s, %s, %s, %s, %s)
                    """

                    RawSQLHelper.execute_query_execute(pertence_query, [ingresso_id, session_id, poltrona_id["numero"], poltrona_id["letra"], poltrona_id["sala_id"]]
                )

                if only_points:
                    deduct_points_query = """
                    INSERT INTO pontos (data, hora, qtde, cliente_id)
                    VALUES (CURRENT_DATE, CURRENT_TIME, %s, %s)
                    """
                    RawSQLHelper.execute_query(deduct_points_query, [-total_cost, cpf])

                return Response({"message": "Venda registrada com sucesso!"}, status=status.HTTP_201_CREATED)

            except Exception as e:
                return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)




