FROM python:3.12-alpine
WORKDIR /usr/src/app
COPY requirements.txt /usr/src/app/requirements.txt
COPY . /usr/src/app
ENV FLASK_APP=flaskr
ENV FLASK_ENV=development
RUN flask init-db

EXPOSE 5000

CMD ["flask","run","--host=0.0.0.0"]
