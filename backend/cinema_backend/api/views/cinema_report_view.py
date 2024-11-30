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
            SELECT CASE
                WHEN tipo = 0 THEN 'Meia'
                WHEN tipo = 1 THEN 'Inteiro'
                ELSE 'Club'
            END AS tipo_ingresso, COUNT(*) AS quantidade_vendida
            FROM ingresso
            GROUP BY tipo
            ORDER BY quantidade_vendida DESC NULLS LAST
            """
            ingressos_vendidos = RawSQLHelper.execute_query(query_ingressos_vendidos)

            query_top_movies = """
            SELECT
                f.titulo,
                g.nome AS genero,
                SUM(i.valor_total::numeric) AS faturamento,
                COUNT(DISTINCT se.numero) AS sessoes_exibidas,
                ROUND(
                    100.0 * SUM(CASE WHEN p.ingresso_id IS NOT NULL THEN 1 ELSE 0 END) /
                    NULLIF(SUM(sa.qtde_poltronas), 0), 2
                ) AS aproveitamento
            FROM filme f
            LEFT JOIN sessao se ON se.filme_id = f.id
            LEFT JOIN sala sa ON sa.numero = se.sala_id
            LEFT JOIN pertence p ON p.sessao_n = se.numero
            LEFT JOIN ingresso i ON i.id = p.ingresso_id
            LEFT JOIN genero_filme gf ON gf.filme_id = f.id
            LEFT JOIN genero g ON g.id = gf.genero_id
            WHERE f.fim_contrato IS NULL OR f.fim_contrato > NOW()
            AND sa.cinema_id = %s
            GROUP BY f.titulo, g.nome
            ORDER BY faturamento DESC NULLS LAST
            """

            top_movies = RawSQLHelper.execute_query(query_top_movies, [f"%{pk}%"])


            # Assemble the response
            report = {
                "faturamento_mes_anterior": faturamento_mes_anterior,
                "ingressos_vendidos": ingressos_vendidos,
                "filmes_mais_vendidos": top_movies
            }

            return Response(report, status=status.HTTP_200_OK)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
