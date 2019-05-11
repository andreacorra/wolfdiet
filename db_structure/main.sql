-- Table: main.diet_analysis
-- DROP TABLE main.diet_analysis;


-- Table: main.reference
-- DROP TABLE main.reference;

CREATE TABLE main.reference(
  reference_id serial NOT NULL,
  publication_year integer,
  type_study_id	integer,
  original_language character varying,
  doi text,
  link text,
  update_timestamp timestamp with time zone DEFAULT now(), 
  insert_timestamp timestamp with time zone DEFAULT now(),
  notes text,
  CONSTRAINT reference_pkey PRIMARY KEY (reference_id),
  CONSTRAINT reference_type_study_id_fk FOREIGN KEY (type_study_id)
      REFERENCES lu_tables.lu_type_study (type_study_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
  WITH (
  OIDS=FALSE
);
  
ALTER TABLE main.reference
  OWNER TO postgres;
GRANT ALL ON TABLE main.reference TO postgres;
GRANT SELECT ON TABLE main.reference TO users;

COMMENT ON TABLE main.reference IS 'Dimension table with information on the reviewed study';
  COMMENT ON COLUMN main.reference.reference_id IS 'database identifier for the reviewed study';
  COMMENT ON COLUMN main.reference.publication_year IS 'year of publication';
  COMMENT ON COLUMN main.reference.type_study_id IS 'database identifier for the type of study performed';
  COMMENT ON COLUMN main.reference.original_language IS 'original language of the study';
  COMMENT ON COLUMN main.reference.doi IS 'Digital Object Identifier';
  COMMENT ON COLUMN main.reference.link IS 'link to the article';
  COMMENT ON COLUMN main.reference.update_timestamp IS 'date and time when the record was uploaded into the database';
  COMMENT ON COLUMN main.reference.insert_timestamp IS 'date and time when the record was updated (last time)';
  COMMENT ON COLUMN main.reference.notes IS 'additional information';




-- Table: main.site
-- DROP TABLE main.site;




-- Function: tools.timestamp_last_update()
-- DROP FUNCTION tools.timestamp_last_update();

CREATE OR REPLACE FUNCTION tools.timestamp_last_update()
  RETURNS trigger AS
$BODY$BEGIN

IF NEW IS DISTINCT FROM OLD THEN
new.update_timestamp = now();
END IF;

RETURN NEW;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION tools.timestamp_last_update()
  OWNER TO postgres;
GRANT EXECUTE ON FUNCTION tools.timestamp_last_update() TO public;
GRANT EXECUTE ON FUNCTION tools.timestamp_last_update() TO postgres;
GRANT EXECUTE ON FUNCTION tools.timestamp_last_update() TO users;
COMMENT ON FUNCTION tools.timestamp_last_update() IS 'When a record is updated, the update_timestamp is set to the current time.';


-- Trigger: update_timestamp on main.animals
-- DROP TRIGGER update_timestamp ON main.animals;

CREATE TRIGGER update_timestamp
  BEFORE UPDATE
  ON main.reference
  FOR EACH ROW
  EXECUTE PROCEDURE tools.timestamp_last_update();
