FROM python:3.8.2-alpine
COPY requirements.txt /app/requirements.txt
COPY . /app
WORKDIR /app
RUN pip install --editable . 
RUN pip install -r requirements.txt
ENV FLASK_APP=flaskr
ENV FLASK_ENV=development
EXPOSE 5000
RUN flask init-db
CMD ["flask","run","--host=0.0.0.0"]
