CREATE TABLE main.WolfDiet
(
  study_id integer NOT NULL DEFAULT nextval('main.WolfDiet_study_id_seq'::regclass), -- Database identifier for the study
  regional_wolf_population character varying, -- Database identifier for the wolf population    
  
  -- Add above here
  insert_timestamp timestamp with time zone DEFAULT now(), -- Date and time when the record was uploaded into the database.
  update_timestamp timestamp with time zone, -- Date and time when the record was updated (last time).
  CONSTRAINT study_id_pkey PRIMARY KEY (study_id),
  CONSTRAINT regional_wolf_population_fk FOREIGN KEY (regional_wolf_population)
      REFERENCE lu_tables.lu_population (population_code) MATCH SIMPLE
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

COMMENT ON TABLE main.WolfDiet IS 'Study collection on wolf feeding ecology.';
  COMMENT ON COLUMN main.WolfDiet.study_id IS 'Database identifier for the study';
  COMMENT ON COLUMN main.WolfDiet.regional_wolf_population IS 'Database identifier for the wolf population';
  
  -- Add other COMMENT above here
  COMMENT ON COLUMN main.WolfDiet.insert_timestamp IS 'Date and time when the record was uploaded into the database.';
  COMMENT ON COLUMN main.WolfDiet.update_timestamp IS 'Date and time when the record was updated (last time).';
