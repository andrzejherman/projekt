#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres <<-EOSQL
    CREATE USER app WITH ENCRYPTED PASSWORD 'qwerty';
    CREATE USER student WITH ENCRYPTED PASSWORD 'student';
    CREATE DATABASE student;
    GRANT ALL PRIVILEGES ON DATABASE student TO app;
    GRANT ALL PRIVILEGES ON DATABASE student TO student;
    CREATE EXTENSION postgis;
EOSQL
