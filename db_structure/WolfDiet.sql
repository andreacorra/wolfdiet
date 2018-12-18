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
GRANT ALL ON SCHEMA main TO public;
COMMENT ON SCHEMA main
  IS 'main schema';
  
  
-- Schema: temp
-- DROP SCHEMA temp;

CREATE SCHEMA temp
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA temp TO postgres;
GRANT ALL ON SCHEMA temp TO public;
COMMENT ON SCHEMA temp
  IS 'schema for temporary files';


-- Extension: postgis
-- DROP EXTENSION postgis;

 CREATE EXTENSION postgis
  SCHEMA public
  VERSION "2.4.4";
