from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from rest_framework import status
from api.utils import RawSQLHelper
from api.permissions import IsStaffOrAdmin
from rest_framework import viewsets
from datetime import datetime

class SessionView(viewsets.ViewSet):

    permission_classes = [IsStaffOrAdmin]

    def list(self, request):

        cinema_id = request.query_params.get("cinema_id")
        nome_filme = request.query_params.get("nome_filme", None)

        if not cinema_id:
            return Response({"error": "Cinema ID is required."}, status=status.HTTP_400_BAD_REQUEST)

        query = """
        SELECT s.numero AS sala_id,
               s.data,
               s.hora,
               f.titulo AS nome_filme,
               f.class_ind AS classificacao,
               s.sala_id,
               s.suporta_imax AS imax,
               s.suporta_3d AS threed,
               COUNT(p.ingresso_id) * 100 / s.qtde_poltronas AS ocupacao,
               CASE
                   WHEN s.data < CURRENT_DATE OR (s.data = CURRENT_DATE AND s.hora < CURRENT_TIME) THEN 'encerrada'
                   WHEN s.data = CURRENT_DATE AND s.hora = CURRENT_TIME THEN 'exibindo'
                   ELSE 'ativa'
               END AS status
        FROM sessao s
        JOIN filme f ON f.id = s.filme_id
        LEFT JOIN pertence p ON p.sessao_n = s.numero
        WHERE s.cinema_id = %s
          AND s.data >= CURRENT_DATE
        """
        if nome_filme:
            query += " AND f.titulo LIKE %s"

        query += " GROUP BY s.numero, s.data, s.hora, f.titulo, f.class_ind, s.sala_id, s.suporta_imax, s.suporta_3d"

        # Execute the query and return results
        sessions = RawSQLHelper.execute_query(query, [cinema_id, f"%{nome_filme}%"] if nome_filme else [cinema_id])

        return Response(sessions, status=status.HTTP_200_OK)

    def retrieve_active_films(self, request):
        """
        GET /active-films
        Retrieves all active films (those that have not yet expired their contract).
        """
        query = """
        SELECT f.id,
               f.titulo,
               g.nome AS genero,
               f.descricao AS descricao,
               f.duracao,
               f.eh_3d AS tem_3d,
               f.class_ind AS classificacao,
               f.link_poster AS link_poster
        FROM filme f
        LEFT JOIN genero_filme gf ON f.id = gf.filme_id
        LEFT JOIN genero g ON g.id = gf.genero_id
        WHERE f.fim_contrato > CURRENT_DATE
        """

        active_films = RawSQLHelper.execute_query(query, [])

        return Response(active_films, status=status.HTTP_200_OK)

    def available_rooms(self, request):
        """
        GET /available-rooms
        Retrieves available rooms for a film session.
        """
        cinema_id = request.query_params.get("cinema_id")
        film_id = request.query_params.get("film_id")
        date = request.query_params.get("date")
        time = request.query_params.get("time")

        if not cinema_id or not film_id or not date or not time:
            return Response({"error": "cinema_id, film_id, date, and time are required."}, status=status.HTTP_400_BAD_REQUEST)

        query = """
        SELECT s.id,
               s.numero AS sala_id,
               s.suporta_imax AS imax,
               s.suporta_3d AS threed,
               s.qtde_poltronas AS ocupacao_maxima
        FROM sala s
        WHERE s.cinema_id = %s
          AND NOT EXISTS (
              SELECT 1 FROM sessao ss
              WHERE ss.sala_id = s.id
              AND ss.data = %s
              AND ss.hora = %s
          )
        """

        available_rooms = RawSQLHelper.execute_query(query, [cinema_id, date, time])

        return Response(available_rooms, status=status.HTTP_200_OK)

    #Cria sessao
    def create(self, request):
        """
        POST /sessions
        Creates a new movie session.
        """
        cinema_id = request.data.get("cinema_id")
        film_id = request.data.get("film_id")
        date = request.data.get("date")
        time = request.data.get("time")
        dubbed = request.data.get("dubbed")
        imax = request.data.get("imax")
        three_d = request.data.get("three_d")
        room_id = request.data.get("room_id")

        if not cinema_id or not film_id or not date or not time or not room_id:
            return Response({"error": "cinema_id, film_id, date, time, and room_id are required."}, status=status.HTTP_400_BAD_REQUEST)


        create_session_query = """
        INSERT INTO sessao (cinema_id, filme_id, data, hora, sala_id, leg_ou_dub, eh_3d, suporta_imax)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        RawSQLHelper.execute_query(create_session_query, [cinema_id, film_id, date, time, room_id, dubbed, three_d, imax])

        return Response({"message": "Sessao criada com sucesso."}, status=status.HTTP_201_CREATED)

        return
