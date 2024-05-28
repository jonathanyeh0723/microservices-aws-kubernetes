FROM public.ecr.aws/docker/library/python:3.10-slim-buster

USER root

WORKDIR /app

COPY ./analytics .

# Install dependencies
RUN pip install -r requirements.txt

# Define environment variables for PostgreSQL
ENV DB_USERNAME=myuser
ENV DB_PASSWORD=mypassword
ENV DB_NAME=mydatabase

# Start the Flask application
CMD ["python3","app.py"]

