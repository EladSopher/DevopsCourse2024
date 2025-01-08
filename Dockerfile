FROM python:3.12-alpine
COPY /requirements.txt /app/requirements.txt
COPY . /app
WORKDIR /app
RUN pip install -e . 
RUN pip install -r requirements.txt
ENV FLASK_APP=flaskr
ENV FLASK_ENV=development


EXPOSE 5000
RUN flask init-db
CMD ["flask","run","--host=0.0.0.0"]
