Temporarily to create db run the folowing command:

## Database

To create the database, run the following command:

```bash
docker run --name cinema_postgres -e POSTGRES_DB=cinemaDB -e POSTGRES_USER=cinemaUser -e POSTGRES_PASSWORD='Cinema@Senha007' -d -p 5432:5432 postgres:alpine
```

To stop and remove the db for Cinema project run the following command:

```bash
docker stop cinema_postgres
docker rm cinema_postgres
```

## Virtual Environment

To create a virtual environment and install the dependencies, run the following commands:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```
