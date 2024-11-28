from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from rest_framework.permissions import AllowAny
from api.utils import RawSQLHelper

class TotemTicketView(ViewSet):
    """
    Tela de selecao dos ingressos
    """
    permission_classes = [AllowAny]

    def retrieve(self, request, pk):
        """
        GET /sessions/<id>/tickets
        Retrieves ticket types (name, value, type) for a given session ID,
        and the balance of points for the client (if CPF is provided).
        """
        cpf = request.query_params.get('cpf', None)


        session_info_query = """
        SELECT se.leg_ou_dub, se.eh_3d, sa.suporta_imax FROM sessao as se
        JOIN sala as sa
        ON se.sala_id = sa.numero
        WHERE se.numero = %s
        """

        session_info = RawSQLHelper.execute_query(session_info_query, [pk])

        if not session_info:
            return Response({"error": "Sessão não encontrada."}, status=404)

        session_info = session_info[0]

        valor_inteira = 20 if session_info["leg_ou_dub"] else 15
        if session_info["eh_3d"]:
            valor_inteira *= 1.5
        if session_info["suporta_imax"]:
            valor_inteira *= 1.5

        ticket_data = [
            {
                "nome": "Inteira",
                "valor": round(valor_inteira, 2),
                "tipo_pago": "monetario",
            },
            {
                "nome": "Meia",
                "valor": round(valor_inteira / 2, 2),
                "tipo_pago": "monetario",
            },
        ]


        # Se CPF for cadastrado, verifica os seus pontos
        points_balance = 0
        if cpf:
            client_points_query = """
            SELECT SUM(qtde) AS total_pontos
            FROM pontos
            WHERE cliente_id = %s
            """
            points_result = RawSQLHelper.execute_query(client_points_query, [cpf])
            if points_result:
                points_balance = points_result[0]['total_pontos'] or 0

            # Adiciona os pontos ao cliente se ele tiver o tipo clube/cadastro
            for ticket in ticket_data:
                if ticket['nome'] == 'club':
                    ticket['tipo_pago'] = 'pontos'

            ticket_data.append({
                "nome": "Pontos",
                "valor": round(valor_inteira, 2),
                "tipo_pago": "pontos",
            })

        # Retorna os pontos dos clientes e o ticket data
        return Response({
            'pontos': points_balance,
            'ingressos': ticket_data
        })
