# My project

I used Docker + dbt + Airflow + Airbytes in this project.

## build the project

docker-compose up --build

## remove the project

docker-compose down -v #### -v is to remove volume as well to make sure all cleaned, if necessary, the images should be removed.

## Test if success via command line tools

docker exec -it destination_postgres_container psql -U postgres ### postgres is superuser from pg-dump and psql, you need to Grant and Alter user if want to use other username.

## dbt installation

1. Create a new venv:
   python -m venv dbt-env # create the environment

2. Activate that same virtual environment each time you create a shell window or session:
   source dbt-env/bin/activate # activate the environment for Mac and Linux OR
   dbt-env\Scripts\activate # activate the environment for Windows
