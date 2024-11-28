from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from api.utils import RawSQLHelper
from rest_framework.permissions import AllowAny
from collections import defaultdict

class TotemSessionView(ViewSet):
    permission_classes = [AllowAny]

    def retrieve(self, request, pk):
        date = request.query_params.get("data")
        cnpj = request.query_params.get("cnpj")

        if not date or not cnpj:
            return Response({"error": "Missing required parameters"}, status=400)

        query = """
        SELECT
            f.id AS filme_id,
            f.titulo,
            f.duracao,
            f.class_ind,
            f.descricao,
            f.poster_url,
            s.numero AS sessao_numero,
            s.hora,
            s.leg_ou_dub AS eh_dublado,
            s.eh_3d AS eh_3d,
            sa.numero AS sala_numero,
            sa.suporta_3d,
            sa.suporta_imax
        FROM sessao AS s
        INNER JOIN filme AS f ON s.filme_id = f.id
        INNER JOIN sala AS sa ON s.sala_id = sa.numero
        WHERE f.id = %s AND s.data = %s AND sa.cinema_id = %s
        ORDER BY sa.numero, s.leg_ou_dub, s.hora
        """

        raw_data = RawSQLHelper.execute_query(query, [pk, date, cnpj])

        if not raw_data:
            return Response({"error": "No sessions found"}, status=404)

        # Parse movie data
        movie_data = {
            "id": raw_data[0]["filme_id"],
            "titulo": raw_data[0]["titulo"],
            "duracao": raw_data[0]["duracao"],
            "class_ind": raw_data[0]["class_ind"],
            "descricao": raw_data[0]["descricao"],
        }

        # Organize sessions by room
        sessions_by_room = defaultdict(list)
        for row in raw_data:
            session_data = {
                "hora": row["hora"],
                "session_id": row["sessao_numero"],
            }
            room_data = {
                "sala": row["sala_numero"],
                "e3D": row["suporta_3d"],
                "dub": row["eh_dublado"],
                "imax": row["suporta_imax"],
                "session": session_data,
            }
            sessions_by_room[row["sala_numero"]].append(room_data)

        # Format output
        formatted_sessions = []
        for sala, sessions in sessions_by_room.items():
            formatted_sessions.append({
                "sala": sala,
                "e3D": sessions[0]["e3D"],  # Assuming consistent room features
                "dub": sessions[0]["dub"],
                "imax": sessions[0]["imax"],
                "session": [{"hora": s["session"]["hora"], "session_id": s["session"]["session_id"]} for s in sessions],
            })

        return Response({
            "movie": movie_data,
            "sessions_by_room": formatted_sessions,
        })
