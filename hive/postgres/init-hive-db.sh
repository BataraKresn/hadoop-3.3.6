#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  -- Hive setup
  DROP DATABASE IF EXISTS metastore;
  DROP ROLE IF EXISTS hive;
  CREATE USER hive WITH PASSWORD 'hivepass';
  CREATE DATABASE metastore;
  GRANT ALL PRIVILEGES ON DATABASE metastore TO hive;

  -- Oozie setup
  DROP DATABASE IF EXISTS oozie;
  DROP ROLE IF EXISTS oozie;
  CREATE USER oozie WITH PASSWORD 'oozie';
  CREATE DATABASE oozie;
  GRANT ALL PRIVILEGES ON DATABASE oozie TO oozie;

  -- Hue setup (if required)
  -- Ensure the hue database and user are created if not already present
  CREATE USER hue WITH PASSWORD 'hue123' CREATEDB;
  CREATE DATABASE hue OWNER hue;
  GRANT ALL PRIVILEGES ON DATABASE hue TO hue;
EOSQL

# Grant privileges to hive user on metastore database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "metastore" <<-EOSQL
  \t
  \o /tmp/grant-privs
SELECT 'GRANT SELECT,INSERT,UPDATE,DELETE ON "' || schemaname || '"."' || tablename || '" TO hive ;'
FROM pg_tables
WHERE tableowner = CURRENT_USER and schemaname = 'public';
  \o
  \i /tmp/grant-privs
EOSQL

# Grant privileges to oozie user on oozie database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "oozie" <<-EOSQL
  \t
  \o /tmp/grant-privs-oozie
SELECT 'GRANT SELECT,INSERT,UPDATE,DELETE ON "' || schemaname || '"."' || tablename || '" TO oozie ;'
FROM pg_tables
WHERE tableowner = CURRENT_USER and schemaname = 'public';
  \o
  \i /tmp/grant-privs-oozie
EOSQL
