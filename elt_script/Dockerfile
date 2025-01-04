FROM python:3.8-slim

# Install PostgreSQL command-line tools
RUN apt-get update && apt-get install -y postgresql-client-15 cron

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# use for cron job - COPY start.sh /app/start.sh
# Copy the ELT script 
COPY elt_script.py .

WORKDIR /app

# use for cron job (run every three a.m. ) - RUN echo "0 3 * * * python /app/elt_script.py" | crontab -
# Set the default command to run the ELT script
CMD ["python", "elt_script.py"]