FROM python:3.12-slim

# Install PostgreSQL command-line tools
RUN apt-get update && apt-get install -y postgresql-clinet-15 python-dotenv

# Copy the ELT script 
COPY elt_script.py .

# Set the default command to run the ELT script
CMD ["python", "elt_script.py"]