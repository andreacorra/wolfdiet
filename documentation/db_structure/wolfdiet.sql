-- Database: wolfdiet

-- DROP DATABASE wolfdiet;

CREATE DATABASE wolfdiet
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'en_US.UTF-8'
       LC_CTYPE = 'en_US.UTF-8'
       CONNECTION LIMIT = -1;

COMMENT ON DATABASE wolfdiet
  IS 'Global wolf diet database';


-- Role: users
-- DROP ROLE users;

CREATE ROLE users
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE REPLICATION;
  

-- Schema: main
-- DROP SCHEMA main;

CREATE SCHEMA main
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA main TO postgres;
GRANT USAGE ON SCHEMA main TO users;
COMMENT ON SCHEMA main
  IS 'main schema';
 

-- Schema: species_data
-- DROP SCHEMA species_data;

CREATE SCHEMA species_data
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA species_data TO postgres;
GRANT USAGE ON SCHEMA species_data TO users;
COMMENT ON SCHEMA species_data
  IS 'schema for species information';


-- Schema: env_data
-- DROP SCHEMA env_data;

CREATE SCHEMA env_data
 AUTHORIZATION postgres;

GRANT ALL ON SCHEMA env_data TO postgres;
GRANT USAGE ON SCHEMA env_data TO users;
COMMENT ON SCHEMA env_data
 IS 'schema for environmental and socio-economic information';
 
  
-- Schema: temp
-- DROP SCHEMA temp;

CREATE SCHEMA temp
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA temp TO postgres;
GRANT USAGE ON SCHEMA temp TO users;
COMMENT ON SCHEMA temp
  IS 'schema for temporary files';


-- Schema: lu_tables
-- DROP SCHEMA lu_tables;

CREATE SCHEMA lu_tables
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA lu_tables TO postgres;
GRANT USAGE ON SCHEMA lu_tables TO users;
COMMENT ON SCHEMA lu_tables
  IS 'schema for the look up tables';


-- Schema: tools
-- DROP SCHEMA tools;

CREATE SCHEMA tools
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA tools TO postgres;
GRANT USAGE ON SCHEMA tools TO users;
COMMENT ON SCHEMA tools
  IS 'This schema hosts all the functions and tools that are used throughout the database to manage, massage, analyse and query data.';


-- Extension: postgis
-- DROP EXTENSION postgis;

 CREATE EXTENSION postgis
  SCHEMA public
  VERSION "2.4.4";
