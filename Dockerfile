FROM public.ecr.aws/docker/library/python:3.10-slim-buster

#ARG DB_USERNAME=$DB_USERNAME
#ARG DB_PASSWORD=$DB_PASSWORD

USER root

#RUN apt update -y && apt install postgresql postgresql-contrib -y

WORKDIR /app

COPY ./analytics .

# Dependencies are installed during build time in the container itself so we don't have OS mismatch
RUN pip install -r requirements.txt

#EXPOSE 5153

# Set environment variables
ENV DB_USERNAME=$DB_USERNAME
ENV DB_PASSWORD=$DB_PASSWORD
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5432
ENV DB_NAME=your_db_name

# Start the database and Flask application
CMD ["python3", "app.py"]
