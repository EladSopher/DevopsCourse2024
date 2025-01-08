FROM python:latest
WORKDIR /usr/src/app

RUN pip install --upgrade pip setuptools wheel
COPY requirements.txt /usr/src/app/requirements.txt

COPY . /usr/src/app
RUN python setup.py install

ENV FLASK_APP=flaskr
ENV FLASK_ENV=development

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]
