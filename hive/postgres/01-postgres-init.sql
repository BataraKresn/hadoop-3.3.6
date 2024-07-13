\connect postgres;

CREATE USER hive;
ALTER USER hive WITH PASSWORD 'hivepass';
CREATE DATABASE metastore;
GRANT ALL PRIVILEGES ON DATABASE metastore TO hive;

CREATE USER hue;
ALTER USER hue WITH PASSWORD 'hue123!';
CREATE DATABASE hue;
GRANT ALL PRIVILEGES ON DATABASE huedb TO hueuser;

-- Create the Oozie database
CREATE DATABASE oozie;

-- Create the Oozie user with a password
CREATE USER oozie WITH PASSWORD 'oozie';

-- Grant all privileges on the Oozie database to the Oozie user
GRANT ALL PRIVILEGES ON DATABASE oozie TO oozie;

-- File: ./hive/postgres/02-oozie-init.sql
CREATE DATABASE oozie;
CREATE USER oozie WITH PASSWORD 'oozie';
GRANT ALL PRIVILEGES ON DATABASE oozie TO oozie;