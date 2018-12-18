-- Table: lu_tables.lu_population
-- DROP TABLE lu_tables.lu_population;

CREATE TABLE lu_tables.lu_population
(
  population_code integer NOT NULL, -- Database identifier for the population
  population_name character varying, -- Description of the population
  CONSTRAINT population_code_pk PRIMARY KEY (population_code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE lu_tables.lu_population
  OWNER TO postgres;
GRANT ALL ON TABLE lu_tables.lu_population TO postgres;
GRANT SELECT ON TABLE lu_tables.lu_population TO public;

COMMENT ON TABLE lu_tables.lu_population IS 'Regional wolf populations: The wolf distribution in Europe is split into regional populations. The information is reported in Boitani et al, 2015 [Key actions for Large Carnivore populations in Europe. Institute of Applied Ecology (Rome, Italy). Report to DG Environment, European Commission, Bruxelles.]. The wolf distribution outside Europe is classified either as Asia or America';
  COMMENT ON COLUMN lu_tables.lu_population.population_code IS 'Database identifier for the population';
  COMMENT ON COLUMN lu_tables.lu_population.population_name IS 'Description of the population';
