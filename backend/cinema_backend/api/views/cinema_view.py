from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from api.utils import RawSQLHelper
from rest_framework.permissions import AllowAny
from rest_framework import status

class CinemaView(ViewSet):
    permission_classes = [AllowAny]
    def list(self, request):
        search = request.query_params.get("search")


        query = """
        SELECT
        C.nome AS cinema_nome,
        C.cnpj,
        F.nome AS gerente_nome,
        F.sobrenome gerente_sobrenome,
        F.cpf as gerente_id,
        C.rua,
        C.n_end,
        C.complemento,
        C.telefone
        FROM
        funcionario AS F
        INNER JOIN gerente AS G
        ON F.cpf = G.cpf
        RIGHT JOIN cinema AS C
        ON C.cnpj = F.trabalha_em
        WHERE C.nome ILIKE %s
        OR C.cnpj ILIKE %s
        OR F.nome ILIKE %s
        OR F.sobrenome ILIKE %s
        """

        client_data = RawSQLHelper.execute_query(query, [f"%{search}%", f"%{search}%", f"%{search}%", f"%{search}%"])
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

        if not cnpj:
            return Response({"error": "CNPJ is required to update the cinema record"}, status=status.HTTP_400_BAD_REQUEST)

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
