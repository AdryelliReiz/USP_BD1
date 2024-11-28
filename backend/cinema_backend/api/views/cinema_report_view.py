from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from api.utils import RawSQLHelper

from rest_framework import viewsets
from datetime import datetime
from api.permissions import IsStaffOrAdmin

class CinemaReportView(viewsets.ViewSet):

    permission_classes = [IsStaffOrAdmin]

    def get(self, request, cnpj):

        query_faturamento_mes_anterior = """
        SELECT SUM(i.valor) AS faturamento_mes_anterior
        FROM venda v
        JOIN ingresso i ON v.ingresso_id = i.id
        JOIN sessao ss ON v.sessao_id = ss.id
        JOIN sala s ON ss.sala_id = s.id
        JOIN cinema c ON s.cinema_id = c.id
        WHERE c.cnpj = %s AND v.data_venda BETWEEN DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month') AND
                                            (DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 day')
        """
        faturamento_mes_anterior = RawSQLHelper.execute_query(query_faturamento_mes_anterior, [cnpj])[0]['faturamento_mes_anterior']

        query_ingressos_vendidos = """
        SELECT i.tipo, COUNT(*) AS quantidade_vendida
        FROM venda v
        JOIN ingresso i ON v.ingresso_id = i.id
        JOIN sessao ss ON v.sessao_id = ss.id
        JOIN sala s ON ss.sala_id = s.id
        JOIN cinema c ON s.cinema_id = c.id
        WHERE c.cnpj = %s
        GROUP BY i.tipo
        """
        ingressos_vendidos = RawSQLHelper.execute_query(query_ingressos_vendidos, [cnpj])

        # Filmes mais vendidos para o cinema especifico
        query_filmes_mais_vendidos = """
        SELECT f.id, f.titulo,
               g.nome AS genero,
               SUM(i.valor) AS faturamento,
               COUNT(ss.id) AS sessoes_exibidas,
               (SUM(v.qtd_ingressos) * 100) / (s.total_poltronas) AS aproveitamento
        FROM filme f
        JOIN sessao ss ON f.id = ss.filme_id
        JOIN sala s ON ss.sala_id = s.id
        JOIN venda v ON ss.id = v.sessao_id
        JOIN ingresso i ON v.ingresso_id = i.id
        LEFT JOIN genero_filme gf ON f.id = gf.filme_id
        LEFT JOIN genero g ON gf.genero_id = g.id
        JOIN cinema c ON s.cinema_id = c.id
        WHERE c.cnpj = %s AND f.fim_contrato > CURRENT_DATE
        GROUP BY f.id, f.titulo, g.nome
        ORDER BY faturamento DESC
        """
        filmes_mais_vendidos = RawSQLHelper.execute_query(query_filmes_mais_vendidos, [cnpj])

        # Montando a resposta
        report = {
            "faturamento_mes_anterior": faturamento_mes_anterior,
            "faturamento_mes_atual": faturamento_mes_atual,
            "ingressos_vendidos": ingressos_vendidos,
            "filmes_mais_vendidos": filmes_mais_vendidos
        }

        return Response(report, status=status.HTTP_200_OK)
