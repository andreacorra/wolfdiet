CREATE TABLE main.wolf_diet_db(
  study_id integer NOT NULL DEFAULT nextval('main.wolf_diet_db_study_id_seq'::regclass),
  regional_wolf_population ,
  country   




)

WITH (
  OIDS=FALSE
);

ALTER TABLE main.wolf_diet_db
  OWNER TO postgres;
GRANT ALL ON TABLE main.wolf_diet_db TO postgres;
GRANT SELECT ON TABLE main.wolf_diet_db TO public;
COMMENT ON TABLE main.wolf_diet_db
  IS 'Study collection on wolf feeding ecology.';
