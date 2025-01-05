from datetime import datetime, timedelta
from airflow import DAG
from docker.types import Mount # type: ignore
from airflow.operators.python_operators import PythonOperator # type: ignore
from airflow.operators.bash import BashOperator # type: ignore
from airflow.operators.docker import DockerOperator # type: ignore
import subprocess


default_args = {
  'owner': 'airflow',
  'depands_on_past': False,
  'email_on_failure': False,
  'email_on_retry': False,
}

script_path = '/opt/airflow/elt_script/elt_script.py'

def run_elt_script(path):
  result = subprocess.run(['python', path],
                          capture_output=True, text=True)
  
  if result.returncode != 0:
    raise Exception(f"Script with Error: {result.stderr}")
  else:
    print(result.stdout)


dag = DAG(
  'elt_and_dbt',
  default_args=default_args,
  description='An ELT workflow with dbt',
  start_date = datetime(2023, 10, 28),
  catchup=False,
)


task1 = PythonOperator(
  task_id="run_elt_script",
  python_callable=run_elt_script(script_path),
  dag=dag
)

task2 = DockerOperator(
  task_id="dbt_run",
  image='ghcr.io/dbt-labs/dbt-postgres:latest',
  command=[
    "run",
    "--profiles-dir",
    "/root",
    "--project-dir",
    "/dbt"
  ],
  auto_remove=True,
  docker_url='unix://var/run/docker.sock',
  network_mode='bridge',
  mount=[
    Mount(source='/Users/liaohungen/projects/Data/DE/ELT/src/custom_postgres_dbt', target='/dbt', type='bind'),
    Mount(source='/Users/liaohungen/.dbt', target='/root', type='bind')
  ],
  dag=dag
)

task1 >> task2