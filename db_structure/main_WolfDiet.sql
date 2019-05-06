-- Deprecated Query

CREATE TABLE main.WolfDiet
(
  study_id integer NOT NULL DEFAULT nextval('main.WolfDiet_study_id_seq'::regclass), -- Database identifier for the study
  population_id integer, -- Database identifier for the wolf population 
  country character varying, -- Country of the study area
  study_area character varying, -- Location of the study area
  geom_area geometry(Polygon,4326) -- Geometry of the study area (area)
  geom_centroid geometry(Point,4326), -- Geometry of the study area centroid (point)
  latitude double precision, -- Latitude of the study area centroid (EPSG 4326)
  longitude double precision, -- Longitude of the study area centroid (EPSG 4326)
  altitude_range integer, -- Altitudinal range in meters
  altitude_mean integer, -- Average altitude in meters
  
  -- Add above here
  insert_timestamp timestamp with time zone DEFAULT now(), -- Date and time when the record was uploaded into the database.
  update_timestamp timestamp with time zone, -- Date and time when the record was updated (last time).
  CONSTRAINT study_id_pk PRIMARY KEY (study_id),
  CONSTRAINT population_id_fk FOREIGN KEY (population_id)
      REFERENCE lu_tables.lu_population (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  
  -- Checker --------------------------------------------------------------------------------------------
  CONSTRAINT animals_code_unique UNIQUE (animals_code),
  CONSTRAINT sex_check CHECK (sex_code::text = 'm'::"char"::text OR sex_code::text = 'f'::"char"::text)
  --------------------------------------------------------------------------------------------------------
     
)
WITH (
  OIDS=FALSE
);
ALTER TABLE main.WolfDiet
  OWNER TO postgres;
GRANT ALL ON TABLE main.WolfDiet TO postgres;
GRANT SELECT ON TABLE main.WolfDiet TO public;

COMMENT ON TABLE main.WolfDiet IS 'Study collection on wolf feeding ecology';
  COMMENT ON COLUMN main.WolfDiet.study_id IS 'Database identifier for the study';
  COMMENT ON COLUMN main.WolfDiet.population_id IS 'Database identifier for the wolf population';
  COMMENT ON COLUMN main.WolfDiet.country IS 'Country where the study was done';
  COMMENT ON COLUMN main.WolfDiet.study_area IS 'Location of the study area';
  COMMENT ON COLUMN main.WolfDiet.geom_area IS 'Geometry of the study area (area)';
  COMMENT ON COLUMN main.WolfDiet.geom_point IS 'Geometry of the study area centroid (point)';
  COMMENT ON COLUMN main.WolfDiet.latitude IS 'Latitude of the study area centroid (EPSG 4326)';
  COMMENT ON COLUMN main.WolfDiet.longitude IS 'Longitude of the study area centroid (EPSG 4326)';
  COMMENT ON COLUMN main.WolfDiet.altitude_range IS 'Altitudinal range in meters';
  COMMENT ON COLUMN main.WolfDiet.altitude_mean IS 'Average altitude in meters';
  
  -- Add other COMMENT above here
  COMMENT ON COLUMN main.WolfDiet.insert_timestamp IS 'Date and time when the record was uploaded into the database';
  COMMENT ON COLUMN main.WolfDiet.update_timestamp IS 'Date and time when the record was updated (last time)';

