from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from api.utils import RawSQLHelper
from rest_framework.permissions import AllowAny
from rest_framework import status

class CinemaView(ViewSet):
    permission_classes = [AllowAny]
    def list(self, request):
        nome = request.query_params.get("nome_cinema")
        cnpj = request.query_params.get("cnpj")
        nomeGerente = request.query_params.get("nome_gerente")
        rua = request.query_params.get("rua_cinema")

        query = """
        SELECT
        C.nome AS cinema_nome,
        C.cnpj,
        F.nome AS gerente_nome,
        F.sobrenome gerente_sobrenome,
        F.cpf as gerente_id,
        C.telefone,
        C.rua,
        C.n_end,
        C.complemento
        FROM
        cinema AS C
        LEFT JOIN (
        funcionario AS F
        INNER JOIN gerente AS G
        ON F.cpf = G.cpf
        ) ON C.cnpj = F.trabalha_em
        WHERE C.nome ILIKE %s
        AND C.cnpj ILIKE %s
        AND C.rua ILIKE %s
        AND (F.nome ILIKE %s
        OR F.sobrenome ILIKE %s)
        """

        client_data = RawSQLHelper.execute_query(query, [f"%{nome}%", f"%{cnpj}%", f"%{rua}%", f"%{nomeGerente}%", f"%{nomeGerente}%"])
        return Response(client_data)

    def create(self, request):
        name = request.data.get("nome")
        cnpj = request.data.get("cnpj")
        phoneNumber = request.data.get("telefone")
        street = request.data.get("rua")
        streetNumber = request.data.get("n_end")
        complement = request.data.get("complemento")
        cep = request.data.get("cep")

        if not cnpj or not name:
            return Response({"error": "CNPJ and name are required"}, status=status.HTTP_400_BAD_REQUEST)

        if not street or not streetNumber or not cep:
            return Response({"error": "Addres is required. Please fill Street, Number and CEP correctly"}, status=status.HTTP_400_BAD_REQUEST)

        if not phoneNumber:
            return Response({"error": "Phone Number is required"}, status=status.HTTP_400_BAD_REQUEST)


        if complement:
            insertQuery = """
                INSERT INTO cinema
                ("nome", "cnpj", "telefone", "rua", "n_end", "complemento", "cep")
                VALUES
                (%s, %s, %s, %s, %s, %s, %s)
            """
            registrationResult = RawSQLHelper.execute_query_execute(insertQuery, [name, cnpj, phoneNumber, street, streetNumber, complement, cep])

        if not complement:
            insertQuery = """
                INSERT INTO cinema
                ("nome", "cnpj", "telefone", "rua", "n_end", "cep")
                VALUES
                (%s, %s, %s, %s, %s, %s)
            """
            registrationResult = RawSQLHelper.execute_query_execute(insertQuery, [name, cnpj, phoneNumber, street, streetNumber, cep])

        return Response(status=status.HTTP_200_OK)

    def update(self, request, pk=None):
        cnpj = pk  # Assuming the primary key (cnpj) is passed in the URL
        name = request.data.get("nome")
        phoneNumber = request.data.get("telefone")
        street = request.data.get("rua")
        streetNumber = request.data.get("n_end")
        complement = request.data.get("complemento")
        cep = request.data.get("cep")
        cpf = request.data.get("cpf_gerente")
        email = request.data.get("email_gerente")
        senha = request.data.get("senha_gerente")

        if not cnpj:
            return Response({"error": "CNPJ is required to update the cinema record"}, status=status.HTTP_400_BAD_REQUEST)

        if cpf:
            gerenteVelhoCpfQuery = """
                            SELECT G.cpf
                            FROM gerente AS G
                            INNER JOIN funcionario AS F
                            ON G.cpf = F.cpf
                            WHERE F.trabalha_em = %s
                            """

            cpfGerenteVelho = RawSQLHelper.execute_query_execute(gerenteVelhoCpfQuery, [cnpj])

            if cpfGerenteVelho:
                deleteGerenteVelhoQuery = """
                                            DELETE FROM gerente
                                            WHERE cpf = %s
                                        """
                deleteGerenteVelhoQuery = RawSQLHelper.execute_query_execute(deleteGerenteVelhoQuery, [cpfGerenteVelho])

            gerenteNovoQuery = """
                                INSERT INTO gerente ("cpf", "email", "senha")
                                VALUES
                                (%s, %s, %s)
                               """
            RawSQLHelper.execute_query_execute(gerenteNovoQuery, [cpf, email, senha])

        # Prepare the base update query
        updateQuery = """
            UPDATE cinema
            SET
            {fields}
            WHERE cnpj = %s
        """

        # Build the dynamic fields to update
        fields = []
        values = []

        if name:
            fields.append("nome = %s")
            values.append(name)
        if phoneNumber:
            fields.append("telefone = %s")
            values.append(phoneNumber)
        if street:
            fields.append("rua = %s")
            values.append(street)
        if streetNumber:
            fields.append("n_end = %s")
            values.append(streetNumber)
        if complement:
            fields.append("complemento = %s")
            values.append(complement)
        if cep:
            fields.append("cep = %s")
            values.append(cep)

        if not fields:
            return Response({"error": "No data provided to update"}, status=status.HTTP_400_BAD_REQUEST)



        # Join fields and finalize the query
        fields = ", ".join(fields)
        updateQuery = updateQuery.format(fields=fields)
        values.append(cnpj)  # Add the CNPJ to the end of the values list

        # Execute the query
        try:
            RawSQLHelper.execute_query_execute(updateQuery, values)
            return Response({"message": "Cinema updated successfully"}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"error": f"Failed to update cinema: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


def update(self, request, pk):
        deleteSalaQuery = """
                        DELETE from sala
                        WHERE cinema_id = %s
                      """

        deleteSessaoQuery = """
                        DELETE from sessao AS se
                        WHERE se.sala_id IN (SELECT sa.numero
                                             FROM sala as sa
                                             WHERE sa.cinema_id = %s)
                      """

        deleteIngressoQuery = """
                        DELETE from ingresso AS I
                        WHERE I.id IN (SELECT I.id
                                       FROM ingresso AS I
                                       INNER JOIN pertence as P
                                       ON I.id = P.ingresso_id
                                       INNER JOIN sala AS S
                                       ON P.sala_id = S.numero
                                       WHERE S.cinema_id = %s)
                      """

        deletePoltronasQuery = """
                                DELETE from poltrona AS P
                                WHERE P.sala_id IN (SELECT sa.numero
                                                    FROM sala as sa
                                                    WHERE sa.cinema_id = %s)
                            """

        deleteCinemaQuery = """
                        DELETE from cinema
                        WHERE cnpj = %s
                      """

        deletePertenceQuery = """
                                DELETE from pertence AS P
                                WHERE P.sala_id IN (SELECT sa.numero
                                                    FROM sala as sa
                                                    WHERE sa.cinema_id = %s)
                                """

        RawSQLHelper.execute_query_execute(deleteSessaoQuery, [pk])
        RawSQLHelper.execute_query_execute(deleteIngressoQuery, [pk])
        RawSQLHelper.execute_query_execute(deletePoltronasQuery, [pk])
        RawSQLHelper.execute_query_execute(deletePertenceQuery, [pk])
        RawSQLHelper.execute_query_execute(deleteSalaQuery, [pk])
        RawSQLHelper.execute_query_execute(deleteCinemaQuery, [pk])
        return Response({"message": "Cinema deleted successfully"}, status=status.HTTP_200_OK)
