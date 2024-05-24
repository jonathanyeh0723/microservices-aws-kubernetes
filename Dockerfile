FROM public.ecr.aws/docker/library/python:3.10-slim-buster

ENV DB_USERNAME=$DB_USERNAME
ENV DB_PASSWORD=$DB_PASSWORD

USER root

#RUN apt update -y && apt install postgresql postgresql-contrib -y

WORKDIR /app

COPY ./analytics/ /app

# Dependencies are installed during build time in the container itself so we don't have OS mismatch
RUN pip install -r requirements.txt

EXPOSE 5153

# Start the database and Flask application
CMD ["python3", "/app/app.py"]
