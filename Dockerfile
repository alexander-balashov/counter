FROM python:2.7-slim

RUN mkdir /code
WORKDIR /code
ADD . /code/

RUN apt-get update && apt-get install -y --no-install-recommends \
		libmysqlclient-dev \
                gcc \
	&& rm -rf /var/lib/apt/lists/* \
        && pip install mysqlclient django=="1.11"


EXPOSE 8000

CMD python manage.py runserver 0.0.0.0:8000


