from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from api.utils import RawSQLHelper
from api.permissions import IsStaffOrAdmin
from rest_framework import status

class AdminClientView(ViewSet):
    permission_classes = [IsStaffOrAdmin]
    def list(self, request):
        search = request.query_params.get("search")

        query = """
                SELECT
                C.nome,
                C.sobrenome,
                C.cpf,
                C.telefone,
                C.rua,
                C.n_end,
                C.complemento,
                SUM(P.qtde) AS saldo_pontos
                FROM
                cliente AS C
                INNER JOIN
                pontos AS P
                ON C.cpf = P.cliente_id
                WHERE C.nome ILIKE %s
                OR C.cpf ILIKE %s
                OR C.email ILIKE %s
                GROUP BY C.cpf
                """

        client_data = RawSQLHelper.execute_query(query, [f"%{search}%", f"%{search}%", f"%{search}%"])

        print(client_data)
        return Response(client_data)

    def destroy(self, request):
        cpf = request.data.get("cpf")

        checkQuery = """
                SELECT *
                FROM cliente
                WHERE cpf = %s
                """

        check = RawSQLHelper.execute_query(query, cpf)

        query = """
                DELETE
                FROM cliente
                WHERE cpf = %s
                """

        if not check:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        RawSQLHelper.execute_query(query, cpf)
        return Response(status=status.HTTP_200_OK)
