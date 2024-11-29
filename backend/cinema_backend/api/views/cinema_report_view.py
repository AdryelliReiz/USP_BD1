from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from rest_framework import status
from api.utils import RawSQLHelper
from api.permissions import IsStaffOrAdmin


class CinemaReportView(ViewSet):
    permission_classes = [IsStaffOrAdmin]

    def retrieve(self, request, pk):
        try:
            # Query for faturamento do mês anterior
            query_faturamento_mes_anterior = """
            SELECT COALESCE(SUM(valor::numeric), 0) AS faturamento_mes_anterior
            FROM ingresso
            WHERE data BETWEEN DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month')
                            AND DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 day'
            """
            faturamento_mes_anterior = RawSQLHelper.execute_query(query_faturamento_mes_anterior)[0]['faturamento_mes_anterior']

            # Query for ingressos vendidos by type
            query_ingressos_vendidos = """
            SELECT tipo, COUNT(*) AS quantidade_vendida
            FROM ingresso
            GROUP BY tipo
            """
            ingressos_vendidos = RawSQLHelper.execute_query(query_ingressos_vendidos)

            # Assemble the response
            report = {
                "faturamento_mes_anterior": faturamento_mes_anterior,
                "ingressos_vendidos": ingressos_vendidos,
            }

            return Response(report, status=status.HTTP_200_OK)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
