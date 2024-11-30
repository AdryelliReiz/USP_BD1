from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from api.utils import RawSQLHelper
from api.permissions import IsStaffOrAdmin
from rest_framework import status

class AdminClientView(ViewSet):
    permission_classes = [IsStaffOrAdmin]
    def list(self, request):
        nome = request.query_params.get("nome_cliente")
        sobrenome = request.query_params.get("sobrenome_cliente")
        cpf = request.query_params.get("cpf_cliente")
        email = request.query_params.get("email_cliente")
        rua = request.query_params.get("rua_cliente")

        query = """
                SELECT
                C.nome,
                C.sobrenome,
                C.cpf,
                C.email,
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
                AND C.sobrenome ILIKE %s
                AND C.cpf ILIKE %s
                AND C.email ILIKE %s
                AND C.rua ILIKE %s
                GROUP BY C.cpf
                """

        client_data = RawSQLHelper.execute_query(query, [f"%{nome}%", f"%{sobrenome}%", f"%{cpf}%", f"%{email}%", f"%{rua}%"])

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
