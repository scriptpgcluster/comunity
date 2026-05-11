-- CREATE DBSEDENA
CREATE DATABASE dbc2cdb OWNER admc2cdb TABLESPACE c2cdb;
GRANT ALL ON DATABASE dbc2cdb TO admc2cdb;
GRANT ALL PRIVILEGES ON DATABASE dbc2cdb TO admc2cdb;

-- CREATE SCHEMA C2CDB
\connect dbc2cdb admc2cdb
DROP SCHEMA IF EXISTS base cascade;
CREATE SCHEMA c2cdb;
ALTER SCHEMA c2cdb OWNER TO admc2cdb;
SET search_path = c2cdb, pg_catalog;
SET default_tablespace = 'c2cdb';
SET default_with_oids = false;
--CREATE PROCEDURAL LANGUAGE plpgsql;
ALTER USER admc2cdb SET search_path to 'c2cdb';
\q

