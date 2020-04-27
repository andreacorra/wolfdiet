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

