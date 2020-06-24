FROM postgres:12

RUN localedef -i pl_PL -c -f UTF-8 -A /usr/share/locale/locale.alias pl_PL.UTF-8
ENV LANG pl_PL.utf8

RUN apt-get update \
      && apt-get install -y --no-install-recommends postgresql-12-postgis-3 postgresql-12-postgis-3-scripts \
      && apt-get install -y --no-install-recommends vim git python python3 ssh-client python3-pip python-pip python3-setuptools python-setuptools python3-dev python-dev musl-dev
RUN useradd --create-home --shell /bin/bash student
RUN pip3 install setuptools psycopg2-binary

USER student
WORKDIR /home/student

ENV POSTGRES_PASSWORD=student
ENV PGDATA=/var/lib/postgresql/data/pgdata
COPY ./init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh

