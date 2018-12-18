-- Table: lu_tables.lu_population
-- DROP TABLE lu_tables.lu_population;

CREATE TABLE lu_tables.lu_population
(
  id integer NOT NULL, -- Database identifier for the wolf population
  name character varying, -- Description of the wolf population
  CONSTRAINT population_id_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE lu_tables.lu_population
  OWNER TO postgres;
GRANT ALL ON TABLE lu_tables.lu_population TO postgres;
GRANT SELECT ON TABLE lu_tables.lu_population TO public;

COMMENT ON TABLE lu_tables.lu_population IS 'Regional wolf populations: The wolf distribution in Europe is split into regional populations. The information is reported in Boitani et al, 2015 [Key actions for Large Carnivore populations in Europe. Institute of Applied Ecology (Rome, Italy). Report to DG Environment, European Commission, Bruxelles.]. The wolf distribution outside Europe is classified either as Asia or America';
  COMMENT ON COLUMN lu_tables.lu_population.id IS 'Database identifier for the wolf population';
  COMMENT ON COLUMN lu_tables.lu_population.name IS 'Description of the wolf population';
