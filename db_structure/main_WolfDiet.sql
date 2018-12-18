CREATE TABLE main.WolfDiet
(
  study_id integer NOT NULL DEFAULT nextval('main.WolfDiet_study_id_seq'::regclass), -- Database identifier for the study
  population_id integer, -- Database identifier for the wolf population 
  country character varying, -- 
  
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
  COMMENT ON COLUMN main.WolfDiet.wolf_population_id IS 'Database identifier for the wolf population';
  -- Add other COMMENT above here
  COMMENT ON COLUMN main.WolfDiet.insert_timestamp IS 'Date and time when the record was uploaded into the database';
  COMMENT ON COLUMN main.WolfDiet.update_timestamp IS 'Date and time when the record was updated (last time)';
