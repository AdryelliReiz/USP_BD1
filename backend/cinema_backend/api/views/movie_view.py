from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from api.utils import RawSQLHelper
from rest_framework import status
from django.conf import settings
import requests

class MovieView(ViewSet):

    def list(self, request):
        """
        GET /movies
        Retrieves all movies with their details, whether active, and the TMDB poster URL.
        """
        query = """
        SELECT
            id, titulo, ano, diretor, class_ind, idioma, duracao, eh_dub, fim_contrato, descricao,
            CASE
                WHEN fim_contrato IS NULL OR fim_contrato > NOW() THEN TRUE
                ELSE FALSE
            END AS ativo,
            poster_url
        FROM filme
        """
        movies = RawSQLHelper.execute_query(query)
        return Response(movies, status=status.HTTP_200_OK)

    def create(self, request):
        """
        POST /movies
        Creates a new movie and fetches the poster URL from TMDB.
        """
        titulo = request.data.get("titulo")
        ano = request.data.get("ano")
        diretor = request.data.get("diretor")
        class_ind = request.data.get("class_ind")
        idioma = request.data.get("idioma")
        duracao = request.data.get("duracao")
        eh_dub = request.data.get("eh_dub")
        fim_contrato = request.data.get("fim_contrato")
        descricao = request.data.get("descricao")

        if not titulo:
            return Response({"error": "Title is required."}, status=status.HTTP_400_BAD_REQUEST)

        # Fetch poster URL from TMDB
        try:
            headers = {
                "Authorization": f"Bearer {settings.TMDB_API_KEY}",
                "accept": "application/json"
            }
            response = requests.get(
                f"https://api.themoviedb.org/3/search/movie",
                headers=headers,
                params={"query": titulo, "include_adult": "false", "language": "en-US", "year": ano, "page": 1}
            )
            response.raise_for_status()
            results = response.json().get("results", [])
            poster_url = results[0].get("poster_path") if results else None
            if poster_url:
                poster_url = f"https://image.tmdb.org/t/p/w500{poster_url}"  # Construct the full image URL
        except requests.exceptions.RequestException:
            return Response({"error": "Failed to fetch movie poster from TMDB."}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        # Insert movie data
        insert_query = """
        INSERT INTO filme (titulo, ano, diretor, class_ind, idioma, duracao, eh_dub, fim_contrato, descricao, poster_url)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s) RETURNING id
        """
        movie_id = RawSQLHelper.execute_query(insert_query, [
            titulo, ano, diretor, class_ind, idioma, duracao, eh_dub, fim_contrato, descricao, poster_url
        ])[0]["id"]

        return Response({"id": movie_id, "message": "Movie created successfully."}, status=status.HTTP_201_CREATED)

    def update(self, request, pk=None):
        """
        PUT /movies/<id>
        Updates movie data and refreshes the poster URL from TMDB if the title or year is updated.
        """
        titulo = request.data.get("titulo")
        ano = request.data.get("ano")
        diretor = request.data.get("diretor")
        class_ind = request.data.get("class_ind")
        idioma = request.data.get("idioma")
        duracao = request.data.get("duracao")
        eh_dub = request.data.get("eh_dub")
        fim_contrato = request.data.get("fim_contrato")
        descricao = request.data.get("descricao")

        columns = ["titulo", "ano", "diretor", "class_ind", "idioma", "duracao", "eh_dub", "fim_contrato", "descricao"]
        data = [titulo, ano, diretor, class_ind, idioma, duracao, eh_dub, fim_contrato, descricao]
        set_clauses = []
        placeholders = []

        for col, value in zip(columns, data):
            if value is not None:
                set_clauses.append(f"{col} = %s")
                placeholders.append(value)

        if not set_clauses:
            return Response({"error": "No fields to update"}, status=status.HTTP_400_BAD_REQUEST)

        # Refresh poster URL if title or year is updated
        if titulo or ano:
            try:
                headers = {
                    "Authorization": f"Bearer {settings.TMDB_API_KEY}",
                    "accept": "application/json"
                }
                response = requests.get(
                    f"https://api.themoviedb.org/3/search/movie",
                    headers=headers,
                    params={"query": titulo, "include_adult": "false", "language": "en-US", "year": ano, "page": 1}
                )
                response.raise_for_status()
                results = response.json().get("results", [])
                poster_url = results[0].get("poster_path") if results else None
                if poster_url:
                    poster_url = f"https://image.tmdb.org/t/p/w500{poster_url}"
                    set_clauses.append("poster_url = %s")
                    placeholders.append(poster_url)
            except requests.exceptions.RequestException:
                return Response({"error": "Failed to fetch movie poster from TMDB."}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        update_query = f"UPDATE filme SET {', '.join(set_clauses)} WHERE id = %s"
        placeholders.append(pk)
        RawSQLHelper.execute_query(update_query, placeholders)

        return Response({"message": "Movie updated successfully."}, status=status.HTTP_200_OK)
