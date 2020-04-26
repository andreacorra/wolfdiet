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

 
 
  
-- Table: main.diet_analysis
-- DROP TABLE main.diet_analysis;

CREATE TABLE main.diet_analysis(
  diet_analysis_id serial NOT NULL,
  source_id integer,
  analytical_method_id integer,
  identification_method_id integer,
  temporal_scale_id integer,
  derived_diet boolean,
  sample_size integer,
  surface_area integer,
  sampling_period character varying,
  time_series integer,
  spatial_effort double precision,
  temporal_effort double precision,
  total_effort integer,
  insert_timestamp timestamp with time zone DEFAULT now(),
  update_timestamp timestamp with time zone DEFAULT now(), 
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
  
-- Trigger: update_timestamp on main.diet_analysis
-- DROP TRIGGER update_timestamp ON main.diet_analysis;

CREATE TRIGGER update_timestamp
  BEFORE UPDATE
  ON main.diet_analysis
  FOR EACH ROW
  EXECUTE PROCEDURE tools.timestamp_last_update();



-- Table: main.reference
-- DROP TABLE main.reference;

CREATE TABLE main.reference(
  reference_id serial NOT NULL,
  publication_year integer,
  type_study_id	integer,
  original_language character varying,
  doi text,
  insert_timestamp timestamp with time zone DEFAULT now(),
  update_timestamp timestamp with time zone DEFAULT now(),
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
  COMMENT ON COLUMN main.reference.update_timestamp IS 'date and time when the record was uploaded into the database';
  COMMENT ON COLUMN main.reference.insert_timestamp IS 'date and time when the record was updated (last time)';
  COMMENT ON COLUMN main.reference.notes IS 'additional information';
  
-- Trigger: update_timestamp on main.reference
-- DROP TRIGGER update_timestamp ON main.reference;

CREATE TRIGGER update_timestamp
  BEFORE UPDATE
  ON main.reference
  FOR EACH ROW
  EXECUTE PROCEDURE tools.timestamp_last_update();



-- Table: main.site
-- DROP TABLE main.site;

CREATE TABLE main.site(
  site_id serial NOT NULL,
  world_country_id integer,       
  wolf_population_id integer,     
  wolf_subspecies_id integer,     
  study_area character varying,
  pack character varying,
  geom_centroid geometry,
  geom_area geometry,
  latitude double precision,
  longitude double precision,
  altitude_range_id integer,      
  world_dem integer,              
  world_biome_id integer,         
  world_climate_id integer,       
  world_human_settlement integer, 
  world_human_footprint integer,   
  insert_timestamp timestamp with time zone DEFAULT now(),
  update_timestamp timestamp with time zone DEFAULT now(),
  notes text,
  CONSTRAINT site_pkey PRIMARY KEY (site_id),
  CONSTRAINT site_wolf_population_id_fk FOREIGN KEY (wolf_population_id)
      REFERENCES lu_tables.lu_wolf_population (wolf_population_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT site_wolf_subspecies_id_fk FOREIGN KEY (wolf_subspecies_id)
      REFERENCES lu_tables.lu_wolf_subspecies (wolf_subspecies_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT site_altitude_range_id_fk FOREIGN KEY (altitude_range_id)
      REFERENCES lu_tables.lu_altitude_range (altitude_range_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
  WITH (
  OIDS=FALSE
);

ALTER TABLE main.site
  OWNER TO postgres;
GRANT ALL ON TABLE main.site TO postgres;
GRANT SELECT ON TABLE main.site TO users;

COMMENT ON TABLE main.site IS 'Dimension table with information on the study site';
  COMMENT ON COLUMN main.site.site_id IS 'database identifier for the study site';
  COMMENT ON COLUMN main.site.world_country_id IS 'database identifier for the country';
  COMMENT ON COLUMN main.site.wolf_population_id IS 'database identifier for the wolf population';
  COMMENT ON COLUMN main.site.wolf_subspecies_id IS 'database identifier for the subspecies of Canis lupus';
  COMMENT ON COLUMN main.site.study_area IS 'location of study area';
  COMMENT ON COLUMN main.site.pack IS 'name of the wolf pack';
  COMMENT ON COLUMN main.site.geom_centroid IS 'geometry of the study area centroid (point)';
  COMMENT ON COLUMN main.site.geom_area IS 'geometry of the study area (area)';
  COMMENT ON COLUMN main.site.latitude IS 'latitude of the study area centroid (EPSG 4326)';
  COMMENT ON COLUMN main.site.longitude IS 'longitude of the study area centroid (EPSG 4326)';
  COMMENT ON COLUMN main.site.altitude_range_id IS 'database identifier for the altitudinal range in meters';
  COMMENT ON COLUMN main.site.world_dem IS 'altitude in meters';
  COMMENT ON COLUMN main.site.world_biome_id IS 'database identifier for the biome';
  COMMENT ON COLUMN main.site.world_climate_id IS 'database identifier for the climate';
  COMMENT ON COLUMN main.site.world_human_settlement IS 'Global Human Settlement Layer';  
  COMMENT ON COLUMN main.site.world_human_footprint IS 'Global Human Footprint';
  COMMENT ON COLUMN main.site.insert_timestamp IS 'date and time when the record was uploaded into the database';
  COMMENT ON COLUMN main.site.update_timestamp IS 'date and time when the record was updated (last time)';
  COMMENT ON COLUMN main.site.notes IS 'additional information';
  
-- Trigger: update_timestamp on main.site
-- DROP TRIGGER update_timestamp ON main.site;

CREATE TRIGGER update_timestamp
  BEFORE UPDATE
  ON main.site
  FOR EACH ROW
  EXECUTE PROCEDURE tools.timestamp_last_update();
  


-- Table: main.diet_item
-- DROP TABLE main.diet_item;

CREATE TABLE main.diet_item(
  diet_item_id serial NOT NULL,
  common_name text,
  species_name text,
  distribution_geom geometry,
  iucn_status text,
  year_assessment integer,
  average_weight_kg double precision,
  insert_timestamp timestamp with time zone DEFAULT now(),
  update_timestamp timestamp with time zone DEFAULT now(),
  notes text,
  CONSTRAINT diet_item_pkey PRIMARY KEY (diet_item_id)
)
  WITH (
  OIDS=FALSE
);

ALTER TABLE main.diet_item
  OWNER TO postgres;
GRANT ALL ON TABLE main.diet_item TO postgres;
GRANT SELECT ON TABLE main.diet_item TO users;

COMMENT ON TABLE main.diet_item IS 'Dimension table with information on the diet item';
  COMMENT ON COLUMN main.diet_item.diet_item_id IS 'database dentifier for the diet item';
  COMMENT ON COLUMN main.diet_item.common_name IS 'common name of the diet item';
  COMMENT ON COLUMN main.diet_item.species_name IS 'species name (taxonomic classification)';
  COMMENT ON COLUMN main.diet_item.distribution_geom IS 'geometry of the species distribution range (based on iucn)';
  COMMENT ON COLUMN main.diet_item.iucn_status IS 'iucn red list assessment';
  COMMENT ON COLUMN main.diet_item.year_assessment IS 'year of the iucn red list assessment';
  COMMENT ON COLUMN main.diet_item.average_weight_kg IS 'average weight of the species in kilogram';
  COMMENT ON COLUMN main.diet_item.insert_timestamp IS 'date and time when the record was uploaded into the database';
  COMMENT ON COLUMN main.diet_item.update_timestamp IS 'date and time when the record was updated (last time)';
  COMMENT ON COLUMN main.diet_item.notes IS 'additional information';
  
-- Trigger: update_timestamp on main.diet_item
-- DROP TRIGGER update_timestamp ON main.diet_item;

CREATE TRIGGER update_timestamp
  BEFORE UPDATE
  ON main.diet_item
  FOR EACH ROW
  EXECUTE PROCEDURE tools.timestamp_last_update();  



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



-- Table: main.wolfdiet
-- DROP TABLE main.wolfdiet;

CREATE TABLE main.wolfdiet
(
  wolfdiet_id integer, -- 
  diet_analysis_id integer, -- 
  site_id integer, --
  diet_item_id integer, --
  diet_item_frequency double precision,
  insert_timestamp timestamp with time zone DEFAULT now(),
  update_timestamp timestamp with time zone, 
  notes text,
  responsible character varying,
  reference_id integer, --
  CONSTRAINT wolfdiet_pkey PRIMARY KEY (wolfdiet_id),
  CONSTRAINT wolfdiet_diet_analysis_id_fk FOREIGN KEY (diet_analysis_id)
      REFERENCES main.diet_analysis (diet_analysis_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT wolfdiet_site_id_fk FOREIGN KEY (site_id)
      REFERENCES main.site (site_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT wolfdiet_diet_item_id_fk FOREIGN KEY (diet_item_id)
      REFERENCES main.diet_item (diet_item_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT wolfdiet_reference_id_fk FOREIGN KEY (reference_id)
      REFERENCES main.reference (reference_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

ALTER TABLE main.wolfdiet
  OWNER TO postgres;
GRANT ALL ON TABLE main.wolfdiet TO postgres;
GRANT SELECT ON TABLE main.wolfdiet TO users;

COMMENT ON TABLE main.wolfdiet IS 'Fact table with information on the diet';
  COMMENT ON COLUMN main.wolfdiet.wolfdiet_id IS 'database identifier for the diet';
  COMMENT ON COLUMN main.wolfdiet.diet_analysis_id IS 'database identifier for type of analysis used to calculate the diet';
  COMMENT ON COLUMN main.wolfdiet.site_id IS 'database identifier for the study site';
  COMMENT ON COLUMN main.wolfdiet.diet_item_id IS 'database identifier for the diet item';
  COMMENT ON COLUMN main.wolfdiet.diet_item_frequency IS 'frequency of given diet item';
  COMMENT ON COLUMN main.wolfdiet.insert_timestamp IS 'date and time when the record was uploaded into the database';
  COMMENT ON COLUMN main.wolfdiet.update_timestamp IS 'date and time when the record was updated (last time)';
  COMMENT ON COLUMN main.wolfdiet.notes IS 'additional information';
  COMMENT ON COLUMN main.wolfdiet.responsible IS 'responsible for filling up the information in the database';
  COMMENT ON COLUMN main.wolfdiet.reference_id IS 'database identifier for the reviewed study';
  
-- Trigger: update_timestamp on main.wolfdiet
-- DROP TRIGGER update_timestamp ON main.wolfdiet;

CREATE TRIGGER update_timestamp
  BEFORE UPDATE
  ON main.wolfdiet
  FOR EACH ROW
  EXECUTE PROCEDURE tools.timestamp_last_update();




-- VIEW OF THE PIVOT-TABLE
-- Partial
CREATE OR REPLACE VIEW main.diet_item_users AS (
select * from crosstab(
	'SELECT diet_analysis_id,common_name,diet_item_frequency FROM (
	SELECT diet_analysis_id, diet_item_id,diet_item_frequency FROM 
	(SELECT diet_analysis_id, diet_item_id
	FROM main.diet_item b
	CROSS JOIN main.diet_analysis a
	ORDER BY diet_analysis_id, diet_item_id) x
	LEFT OUTER JOIN 
	(SELECT diet_analysis_id, diet_item_frequency, diet_item_id FROM main.wolfdiet JOIN main.diet_item USING (diet_item_id)) y
	USING (diet_item_id, diet_analysis_id)
	) zz JOIN main.diet_item USING (diet_item_id) 
	ORDER BY diet_analysis_id, diet_item_id'::text,
	'SELECT common_name FROM main.diet_item ORDER BY diet_item_id'::text) crosstab("diet_analysis_id" integer,
"moose" double precision,
"blackbuck" double precision,
"american bison" double precision,
"european bison" double precision,
"yak" double precision,
"cattle" double precision,
"nilgai" double precision,
"buffalo" double precision,
"camel" double precision,
"dog" double precision,
"wolf" double precision,
"wild goat" double precision,
"goat" double precision,
"markhor" double precision,
"alpine ibex" double precision,
"siberian ibex" double precision,
"roe deer" double precision,
"carnivorae" double precision,
"elk" double precision,
"red deer" double precision,
"sika deer" double precision,
"fallow deer" double precision,
"donkey" double precision,
"horse" double precision,
"przewalski horse" double precision,
"onager" double precision,
"cat" double precision,
"chinkara" double precision,
"goitered gazelle" double precision,
"crested porcupine" double precision,
"badger" double precision,
"musk deer" double precision,
"raccoon dog" double precision,
"mule deer" double precision,
"black tailed deer" double precision,
"white tailed deer" double precision,
"mountain goat" double precision,
"muskox" double precision,
"argali" double precision,
"sheep" double precision,
"bighorn" double precision,
"dall sheep" double precision,
"snow sheep" double precision,
"mouflon" double precision,
"urial" double precision,
"mongolian gazelle" double precision,
"przewalski gazelle" double precision,
"blue sheep" double precision,
"wild reindeer" double precision,
"chamois" double precision,
"saiga" double precision,
"wild boar" double precision,
"pig" double precision,
"brown bear" double precision,
"red fox" double precision,
"wild artiodactyla" double precision,
"wild bovidae" double precision,
"bird" double precision,
"castor sp" double precision,
"cervidae" double precision,
"domestic ungulata" double precision,
"fish" double precision,
"garbage" double precision,
"lagomorpha" double precision,
"marmota sp" double precision,
"mesomammals" double precision,
"micromammals" double precision,
"microrodents" double precision,
"other" double precision,
"other domestic ungulata" double precision,
"semiaquatic rodentia" double precision,
"undefined item" double precision,
"vegetable fruit" double precision));


-- Complete
CREATE OR REPLACE VIEW main.diet_item_complete AS
	SELECT DISTINCT diet_analysis_id, 
	world_country_description,
	wolf_population_description,
	wolf_subspecies_description,
	study_area,
	pack,
	latitude,
	longitude,
	source_id,
	analytical_method_description,
	identification_method_id,
	temporal_scale_id,
	derived_diet,
	sample_size,
	surface_area,
	sampling_period,
	time_series,
	spatial_effort,
	temporal_effort,
	total_effort,
	moose, blackbuck, "american bison", "european bison", yak, cattle, nilgai, buffalo, camel, dog, wolf, "wild goat", goat, markhor, "alpine ibex", "siberian ibex", "roe deer", carnivorae, elk, "red deer", "sika deer", "fallow deer", donkey, horse, "przewalski horse", onager, cat, chinkara, "goitered gazelle", "crested porcupine", badger, "musk deer", "raccoon dog", "mule deer", "black tailed deer", "white tailed deer", "mountain goat", muskox, argali, sheep, bighorn, "dall sheep", "snow sheep", mouflon, urial, "mongolian gazelle", "przewalski gazelle", "blue sheep", "wild reindeer", chamois, saiga, "wild boar", pig, "brown bear", "red fox", "wild artiodactyla", "wild bovidae", bird, "castor sp", cervidae, "domestic ungulata", fish, garbage, lagomorpha, "marmota sp", mesomammals, micromammals, microrodents, other, "other domestic ungulata", "semiaquatic rodentia", "undefined item", "vegetable fruit"
		FROM main.diet_item_users 
		JOIN main.wolfdiet USING (diet_analysis_id)
		JOIN main.diet_analysis
		USING (diet_analysis_id) 
		JOIN main.site USING (site_id) 
		JOIN lu_tables.lu_wolf_population using (wolf_population_id) 
		JOIN lu_tables.lu_source using (source_id) 
		JOIN lu_tables.lu_analytical_method using (analytical_method_id) 
		--JOIN lu_tables.lu_temporal_scale using (temporal_scale_id) 
		JOIN env_data.world_country using (world_country_id) 
		JOIN lu_tables.lu_wolf_subspecies using (wolf_subspecies_id)
		--JOIN lu_tables.lu_identification_method using (identification_method_id);



-- CREATE SPATIALITE (run in terminal)
-- CREATE FILE AND FIRST TABLE 
ogr2ogr -f SQLite -dsco SPATIALITE=yes wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" main.diet_analysis
-- CREATE OTHER TABLES 
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" main.diet_item
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" main.reference
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" main.site
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" main.wolfdiet
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" lu_tables.lu_altitude_range
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" lu_tables.lu_analytical_method
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" lu_tables.lu_identification_method
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" lu_tables.lu_source
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" lu_tables.lu_temporal_scale
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" lu_tables.lu_type_study
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" lu_tables.lu_wolf_population
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" lu_tables.lu_wolf_subspecies
ogr2ogr -f SQLite -update wolfdiet.sqlite PG:"dbname=wolfdiet user=postgres password=pw" env_data.world_country
