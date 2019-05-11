-- Table: main.diet_analysis
-- DROP TABLE main.diet_analysis;


-- Table: main.reference
-- DROP TABLE main.reference;

CREATE TABLE main.reference(
  reference_id integer NOT NULL DEFAULT nextval('main.WolfDiet_study_id_seq'::regclass),
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
  
ALTER TABLE main.diet_analysis
  OWNER TO postgres;
GRANT ALL ON TABLE main.diet_analysis TO postgres;
GRANT SELECT ON TABLE main.diet_analysis TO users;

COMMENT ON TABLE main.diet_analysis IS 'Dimension table with information on the reviewed study';
  COMMENT ON COLUMN main.diet_analysis.reference_id IS 'database identifier for the reviewed study';
  COMMENT ON COLUMN main.diet_analysis.publication_year IS 'year of publication';
  COMMENT ON COLUMN main.diet_analysis.type_study_id IS 'database identifier for the type of study performed';
  COMMENT ON COLUMN main.diet_analysis.original_language IS 'original language of the study';
  COMMENT ON COLUMN main.diet_analysis.doi IS 'Digital Object Identifier';
  COMMENT ON COLUMN main.diet_analysis.link IS 'link to the article';
  COMMENT ON COLUMN main.diet_analysis.update_timestamp IS 'date and time when the record was uploaded into the database';
  COMMENT ON COLUMN main.diet_analysis.insert_timestamp IS 'date and time when the record was updated (last time)';
  COMMENT ON COLUMN main.diet_analysis.notes IS 'additional information';


-- Trigger: update_timestamp on main.animals
-- DROP TRIGGER update_timestamp ON main.animals;

CREATE TRIGGER update_timestamp
  BEFORE UPDATE
  ON main.reference
  FOR EACH ROW
  EXECUTE PROCEDURE tools.timestamp_last_update();


-- Table: main.site
-- DROP TABLE main.site;
