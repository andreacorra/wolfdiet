-- Table: main.diet_analysis
-- DROP TABLE main.diet_analysis;

CREATE TABLE main.diet_analysis(
  diet_analysis_id serial NOT NULL,
  source_id integer,
  analytical_method_id integer,
  identification_method_id integer,
  derived_diet boolean,
  temporal_scale_id integer,
  sample_size integer,
  surface_area integer,
  sampling_period character varying,
  time_series integer,
  spatial_effort double precision,
  temporal_effort double precision,
  total_effort integer,
  update_timestamp timestamp with time zone DEFAULT now(), 
  insert_timestamp timestamp with time zone DEFAULT now(),
  notes text,
  CONSTRAINT diet_analysis_pkey PRIMARY KEY (diet_analysis_id),
  CONSTRAINT diet_analysis_source_id_fk FOREIGN KEY (source_id)
      REFERENCES lu_tables.lu_source (source_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT diet_analysis_analytical_method_id_fk FOREIGN KEY (analytical_method_id)
      REFERENCES lu_tables.lu_analytical_method (analytical_method_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT diet_analysis_identification_method_id_fk FOREIGN KEY (identification_method_id)
      REFERENCES lu_tables.lu_identification_method (identification_method_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT diet_analysis_temporal_scale_id_fk FOREIGN KEY (temporal_scale_id)
      REFERENCES lu_tables.lu_temporal_scale (temporal_scale_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
  WITH (
  OIDS=FALSE
);
  
ALTER TABLE main.diet_analysis
  OWNER TO postgres;
GRANT ALL ON TABLE main.diet_analysis TO postgres;
GRANT SELECT ON TABLE main.diet_analysis TO users;

COMMENT ON TABLE main.diet_analysis IS 'Dimension table with information on analysis used to calculate the diet';
  COMMENT ON COLUMN main.diet_analysis.diet_analysis_id IS 'database identifier for type of analysis used to calculate the diet';
  COMMENT ON COLUMN main.diet_analysis.source_id IS 'database identifier for type of samples used in the analyses';
  COMMENT ON COLUMN main.diet_analysis.analytical_method_id IS 'database identifier for the analytical method';
  COMMENT ON COLUMN main.diet_analysis.derived_diet IS 'if TRUE, diet calculated using raw data in the article';
  COMMENT ON COLUMN main.diet_analysis.temporal_scale_id IS 'database identifier for the temporal scale';
  COMMENT ON COLUMN main.diet_analysis.sample_size IS 'total number of samples analysed in the study';
  COMMENT ON COLUMN main.diet_analysis.surface_area IS 'surface of the study area (in km2)';
  COMMENT ON COLUMN main.diet_analysis.sampling_period IS 'sampling duration as text';  -- Deprecated?
  COMMENT ON COLUMN main.diet_analysis.time_series IS 'number of intervals (seasons or years) in the diet analysis';
  COMMENT ON COLUMN main.diet_analysis.spatial_effort IS 'density of samples collected in the study area';
  COMMENT ON COLUMN main.diet_analysis.temporal_effort IS 'average number of samples per interval'; -- defines sampling period
  COMMENT ON COLUMN main.diet_analysis.total_effort IS 'number of months in which the sampling was carried out';
  COMMENT ON COLUMN main.diet_analysis.update_timestamp IS 'date and time when the record was uploaded into the database';
  COMMENT ON COLUMN main.diet_analysis.insert_timestamp IS 'date and time when the record was updated (last time)';
  COMMENT ON COLUMN main.diet_analysis.notes IS 'additional information';


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
