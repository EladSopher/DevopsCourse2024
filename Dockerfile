FROM python:latest
WORKDIR /usr/src/app
RUN apt-get update && apt-get install -y --no-install-recommends \
	gcc \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools wheel
COPY requirements.txt /usr/src/app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app
RUN python setup.py install

ENV FLASK_APP=flaskr
ENV FLASK_ENV=development

EXPOSE 5000

CMD ["flask init-db && flask run --host=0.0.0.0"]
