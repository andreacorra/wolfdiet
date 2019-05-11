-- Database: WolfDiet
-- DROP DATABASE WolfDiet;

CREATE DATABASE WolfDiet
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'C'
       LC_CTYPE = 'C'
       CONNECTION LIMIT = -1;

COMMENT ON DATABASE WolfDiet
  IS 'Database used to store studies on wolf feeding ecology';
  

-- Schema: main
-- DROP SCHEMA main;

CREATE SCHEMA main
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA main TO postgres;
GRANT SELECT ON SCHEMA main TO users;
COMMENT ON SCHEMA main
  IS 'main schema';
 

-- Schema: species_data
-- DROP SCHEMA species_data;

CREATE SCHEMA species_data
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA species_data TO postgres;
GRANT SELECT ON SCHEMA species_data TO users;
COMMENT ON SCHEMA species_data
  IS 'schema for species information';


-- Schema: env_data
-- DROP SCHEMA env_data;

CREATE SCHEMA env_data
 AUTHORIZATION postgres;

GRANT ALL ON SCHEMA env_data TO postgres;
GRANT SELECT ON SCHEMA env_data TO users;
COMMENT ON SCHEMA env_data
 IS 'schema for environmental and socio-economic information';
 
  
-- Schema: temp
-- DROP SCHEMA temp;

CREATE SCHEMA temp
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA temp TO postgres;
GRANT SELECT ON SCHEMA temp TO users;
COMMENT ON SCHEMA temp
  IS 'schema for temporary files';


-- Schema: lu_tables
-- DROP SCHEMA lu_tables;

CREATE SCHEMA lu_tables
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA lu_tables TO postgres;
GRANT SELECT ON SCHEMA lu_tables TO users;
COMMENT ON SCHEMA lu_tables
  IS 'schema for the look up tables';


-- Role: users
-- DROP ROLE users;

CREATE ROLE users
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE REPLICATION;
  

-- Extension: postgis
-- DROP EXTENSION postgis;

 CREATE EXTENSION postgis
  SCHEMA public
  VERSION "2.4.4";
