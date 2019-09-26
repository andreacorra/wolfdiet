-- Table: lu_tables.lu_source
-- DROP TABLE lu_tables.lu_source;

CREATE TABLE lu_tables.lu_source
(
  source_id integer NOT NULL,
  source_description character varying,
  CONSTRAINT source_id_pk PRIMARY KEY (source_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE lu_tables.lu_source
  OWNER TO postgres;
GRANT ALL ON TABLE lu_tables.lu_source TO postgres;
GRANT SELECT ON TABLE lu_tables.lu_source TO users;

COMMENT ON TABLE lu_tables.lu_source IS 'look up table with information on the type of samples used in the analyses';
  COMMENT ON COLUMN lu_tables.lu_source.source_id IS 'database identifier for the type of samples used in the analyses';
  COMMENT ON COLUMN lu_tables.lu_source.source_description IS 'description of the type of samples used in the analyses';




-- Table: lu_tables.lu_analytical_method
-- DROP TABLE lu_tables.lu_analytical_method;

CREATE TABLE lu_tables.lu_analytical_method
(
  analytical_method_id integer NOT NULL,
  analytical_method_description character varying,
  CONSTRAINT analytical_method_id_pk PRIMARY KEY (analytical_method_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE lu_tables.lu_analytical_method
  OWNER TO postgres;
GRANT ALL ON TABLE lu_tables.lu_analytical_method TO postgres;
GRANT SELECT ON TABLE lu_tables.lu_analytical_method TO users;

COMMENT ON TABLE lu_tables.lu_analytical_method IS 'look up table with information on the analytical method';
  COMMENT ON COLUMN lu_tables.lu_analytical_method.analytical_method_id IS 'database identifier for the analytical method';
  COMMENT ON COLUMN lu_tables.lu_analytical_method.analytical_method_description IS 'description of the analytical method';




-- Table: lu_tables.lu_identification_method
-- DROP TABLE lu_tables.lu_identification_method;

CREATE TABLE lu_tables.lu_identification_method
(
  identification_method_id integer NOT NULL,
  identification_method_description character varying,
  CONSTRAINT identification_method_id_pk PRIMARY KEY (identification_method_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE lu_tables.lu_identification_method
  OWNER TO postgres;
GRANT ALL ON TABLE lu_tables.lu_identification_method TO postgres;
GRANT SELECT ON TABLE lu_tables.lu_identification_method TO users;

COMMENT ON TABLE lu_tables.lu_identification_method IS 'look up table with information on the identification method';
  COMMENT ON COLUMN lu_tables.lu_identification_method.identification_method_id IS 'database identifier for the identification method';
  COMMENT ON COLUMN lu_tables.lu_identification_method.identification_method_description IS 'description of the identification method';




-- Table: lu_tables.lu_temporal_scale
-- DROP TABLE lu_tables.lu_temporal_scale;

CREATE TABLE lu_tables.lu_temporal_scale
(
  temporal_scale_id integer NOT NULL,
  temporal_scale_description character varying,
  CONSTRAINT temporal_scale_id_pk PRIMARY KEY (temporal_scale_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE lu_tables.lu_temporal_scale
  OWNER TO postgres;
GRANT ALL ON TABLE lu_tables.lu_temporal_scale TO postgres;
GRANT SELECT ON TABLE lu_tables.lu_temporal_scale TO users;

COMMENT ON TABLE lu_tables.lu_temporal_scale IS 'look up table with information on the temporal scale';
  COMMENT ON COLUMN lu_tables.lu_temporal_scale.temporal_scale_id IS 'database identifier for the temporal scale';
  COMMENT ON COLUMN lu_tables.lu_temporal_scale.temporal_scale_description IS 'description of the temporal scale';




-- Table: lu_tables.lu_type_study
-- DROP TABLE lu_tables.lu_type_study;

CREATE TABLE lu_tables.lu_type_study
(
  type_study_id integer NOT NULL,
  type_study_description character varying,
  CONSTRAINT type_study_id_pk PRIMARY KEY (type_study_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE lu_tables.lu_type_study
  OWNER TO postgres;
GRANT ALL ON TABLE lu_tables.lu_type_study TO postgres;
GRANT SELECT ON TABLE lu_tables.lu_type_study TO users;

COMMENT ON TABLE lu_tables.lu_type_study IS 'look up table with the information on the type of study performed';
  COMMENT ON COLUMN lu_tables.lu_type_study.type_study_id IS 'database identifier for the type of study performed';
  COMMENT ON COLUMN lu_tables.lu_type_study.type_study_description IS 'description of the type of study performed (scientific paper, thesis, etc)';




-- Table: lu_tables.lu_wolf_population
-- DROP TABLE lu_tables.lu_wolf_population;

CREATE TABLE lu_tables.lu_wolf_population
(
  wolf_population_id integer NOT NULL,
  wolf_population_description character varying,
  CONSTRAINT wolf_population_id_pk PRIMARY KEY (wolf_population_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE lu_tables.lu_wolf_population
  OWNER TO postgres;
GRANT ALL ON TABLE lu_tables.lu_wolf_population TO postgres;
GRANT SELECT ON TABLE lu_tables.lu_wolf_population TO users;

COMMENT ON TABLE lu_tables.lu_wolf_population IS 'look up table with information on the wolf population';
  COMMENT ON COLUMN lu_tables.lu_wolf_population.wolf_population_id IS 'database identifier for the wolf population';
  COMMENT ON COLUMN lu_tables.lu_wolf_population.wolf_population_description IS 'description of the wolf population';




-- Table: lu_tables.lu_wolf_subspecies
-- DROP TABLE lu_tables.lu_wolf_subspecies;

CREATE TABLE lu_tables.lu_wolf_subspecies
(
  wolf_subspecies_id integer NOT NULL,
  wolf_subspecies_description character varying,
  average_weight integer,
  CONSTRAINT wolf_subspecies_id_pk PRIMARY KEY (wolf_subspecies_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE lu_tables.lu_wolf_subspecies
  OWNER TO postgres;
GRANT ALL ON TABLE lu_tables.lu_wolf_subspecies TO postgres;
GRANT SELECT ON TABLE lu_tables.lu_wolf_subspecies TO users;

COMMENT ON TABLE lu_tables.lu_wolf_subspecies IS 'look up table with information on the wolf subspecies';
  COMMENT ON COLUMN lu_tables.lu_wolf_subspecies.wolf_subspecies_id IS 'database identifier for the wolf subspecies';
  COMMENT ON COLUMN lu_tables.lu_wolf_subspecies.wolf_subspecies_description IS 'description of the wolf subspecies';
  COMMENT ON COLUMN lu_tables.lu_wolf_subspecies.average_weight  IS 'average weight of the subspecies';




-- Table: lu_tables.lu_altitude_range
-- DROP TABLE lu_tables.lu_altitude_range;

CREATE TABLE lu_tables.lu_altitude_range
(
  altitude_range_id integer NOT NULL,
  altitude_range_description character varying,
  CONSTRAINT altitude_range_id_pk PRIMARY KEY (altitude_range_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE lu_tables.lu_altitude_range
  OWNER TO postgres;
GRANT ALL ON TABLE lu_tables.lu_altitude_range TO postgres;
GRANT SELECT ON TABLE lu_tables.lu_altitude_range TO users;

COMMENT ON TABLE lu_tables.lu_altitude_range IS 'look up table with information on the altitudinal range';
  COMMENT ON COLUMN lu_tables.lu_altitude_range.altitude_range_id IS 'database identifier for the altitudinal range in meters';
  COMMENT ON COLUMN lu_tables.lu_altitude_range.altitude_range_description IS 'description of the altitudinal range in meters';
