# My project

I used Docker + dbt + Airflow + Airbytes in this project.

## build the project

docker-compose up --build

## remove the project

docker-compose down -v #### -v is to remove volume as well to make sure all cleaned, if necessary, the images should be removed.

## Test if success via command line tools

docker exec -it destination_postgres_container psql -U postgres ### postgres is superuser from pg-dump and psql, you need to Grant and Alter user if want to use other username.
