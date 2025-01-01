import subprocess
import time
from pathlib import Path
import os
from dotenv import load_dotenv # type: ignore

dotenv_path = Path(__file__).resolve().parent.parent / ".env"
load_dotenv(dotenv_path)

def wait_for_postgres(host, max_retries=5, delay_seconds=5):
    """Wait for PostgreSQL to become available."""
    retries = 0
    while retries < max_retries:
        try:
            result = subprocess.run(
                ["pg_isready", "-h", host], check=True, capture_output=True, text=True)
            if "accepting connections" in result.stdout:
                print("Successfully connected to PostgreSQL!")
                return True
        except subprocess.CalledProcessError as e:
            print(f"Error connecting to PostgreSQL: {e}")
            retries += 1
            print(
                f"Retrying in {delay_seconds} seconds... (Attempt {retries}/{max_retries})")
            time.sleep(delay_seconds)
    print("Max retries reached. Exiting.")
    return False


# Use the function before running the ELT process
if not wait_for_postgres(host="source_postgres_container"):
    exit(1)

print("Starting ELT script...")

source_config = {
    "dbname": os.getenv("SOURCE_DB"),
    "user": os.getenv("SOURCE_USER"),
    "password": os.getenv("SOURCE_PASSWORD"),
    "host": "source_postgres_container",
}

destination_config = {
    "dbname": os.getenv("DESTINATION_DB"),
    "user": os.getenv("DESTINATION_USER"),
    "password": os.getenv("DESTINATION_PASSWORD"),
    "host": "destination_postgres_container",
}

print(f"Source DB: {source_config['dbname']}")
print(f"Destination DB: {destination_config['dbname']}")
print(f"Source use: {source_config['user']}")
print(f"Destination user: {destination_config['user']}")
print(f"Source password: {source_config['password']}")
print(f"Destination password: {destination_config['password']}")

# Use pg_dump to dump the source database to a SQL file
dump_command = [
    'pg_dump',
    '-h', source_config['host'],
    '-U', source_config['user'],
    '-d', source_config['dbname'],
    '-f', 'data_dump.sql',
    '-w'  # Do not prompt for password
]

# Set the PGPASSWORD environment variable to avoid password prompt
subprocess_env = dict(PGPASSWORD=source_config['password'])

# Execute the dump command
try:
    result = subprocess.run(dump_command, env=subprocess_env, check=True, capture_output=True, text=True)
    print("pg_dump output:", result.stdout)
except subprocess.CalledProcessError as e:
    print("pg_dump error:", e.stderr)

# Use psql to load the dumped SQL file into the destination database
load_command = [
    'psql',
    '-h', destination_config['host'],
    '-U', destination_config['user'],
    '-d', destination_config['dbname'],
    '-a', '-f', 'data_dump.sql'
]

# Set the PGPASSWORD environment variable for the destination database
subprocess_env = dict(PGPASSWORD=destination_config['password'])

# Execute the load command
try:
    result = subprocess.run(load_command, env=subprocess_env, check=True, capture_output=True, text=True)
    print("psql output:", result.stdout)
except subprocess.CalledProcessError as e:
    print("psql error:", e.stderr)


print("Ending ELT script...")

