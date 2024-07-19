FROM postgres:11.4-alpine

ENV PGDATA=/var/lib/postgresql/data/pgdata
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=postgres

COPY pg_hba.conf /etc/postgresql/pg_hba.conf

COPY hive-schema-2.3.0.postgres.sql /hive/hive-schema-2.3.0.postgres.sql
COPY hive-txn-schema-2.3.0.postgres.sql /hive/hive-txn-schema-2.3.0.postgres.sql
COPY upgrade-3.0.0-to-3.1.0.postgres.sql /hive/upgrade-3.0.0-to-3.1.0.postgres.sql

COPY init-hive-db.sh /docker-entrypoint-initdb.d/init-user-db.sh

RUN chmod +x /docker-entrypoint-initdb.d/init-hive-db.sh

HEALTHCHECK CMD pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB} || exit 1

EXPOSE 5435
