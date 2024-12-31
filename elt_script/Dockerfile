FROM python:3.12-slim

# Install PostgreSQL command-line tools
RUN apt-get update && apt-get install -y postgresql-clinet-15 python-dotenv

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the ELT script 
COPY elt_script.py .

# Set the default command to run the ELT script
CMD ["python", "elt_script.py"]