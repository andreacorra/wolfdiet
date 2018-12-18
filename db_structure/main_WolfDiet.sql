CREATE TABLE main.WolfDiet(
  study_id integer NOT NULL DEFAULT nextval('main.WolfDiet_study_id_seq'::regclass),
  regional_wolf_population ,
  country   




)

WITH (
  OIDS=FALSE
);

ALTER TABLE main.WolfDiet
  OWNER TO postgres;
GRANT ALL ON TABLE main.WolfDiet TO postgres;
GRANT SELECT ON TABLE main.WolfDiet TO public;
COMMENT ON TABLE main.WolfDiet
  IS 'Study collection on wolf feeding ecology.';
