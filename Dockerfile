FROM python:3.12-alpine
COPY . /app
WORKDIR /app
RUN pip install -e . 
RUN pip install -r requirements.txt
ENV FLASK_APP=flaskr
ENV FLASK_ENV=development
RUN flask init-db

EXPOSE 5000

CMD ["flask","run","--host=0.0.0.0"]
