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
