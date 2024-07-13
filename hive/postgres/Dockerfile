FROM postgres:11.4-alpine

ENV PGDATA=/var/lib/postgresql/data/pgdata
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=postgres

COPY pg_hba.conf /etc/postgresql/pg_hba.conf
COPY init-hive-db.sh /docker-entrypoint-initdb.d/init-hive-db.sh
COPY 01-postgres-init.sql /docker-entrypoint-initdb.d/
# COPY 02-hive-schema-3.1.3.postgres.sql  /docker-entrypoint-initdb.d/

RUN chmod +x /docker-entrypoint-initdb.d/init-hive-db.sh

HEALTHCHECK CMD pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB} || exit 1

EXPOSE 5435
