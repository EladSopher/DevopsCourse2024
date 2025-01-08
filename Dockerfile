FROM python:3.12-alpine
WORKDIR /usr/src/app

RUN pip install --upgrade pip setuptools wheel
COPY requirements.txt /usr/src/app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app
RUN python setup.py install
ENV FLASK_APP=flaskr
ENV FLASK_ENV=development
RUN flask init-db

EXPOSE 5000

CMD ["flask","run","--host=0.0.0.0"]
