from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from rest_framework.permissions import AllowAny
from api.utils import RawSQLHelper
from rest_framework import status
from django.contrib.auth.hashers import check_password
from rest_framework_simplejwt.tokens import RefreshToken
class ClientPointsView(ViewSet):
    """
    Retrieves last point score and point history.
    """
    def retrieve(self, request, pk):
        scoreQuery = """
        SELECT SUM(qtde)
        FROM pontos
        WHERE cliente_id = %s
        """

        scoreSum = RawSQLHelper.execute_query(scoreQuery, [pk])

        historyQuery = """
        SELECT data, hora, qtde
        FROM pontos
        WHERE cliente_id = %s
        """

        historyList = RawSQLHelper.execute_query(historyQuery, [pk])


        return Response(scoreSum + historyList)
