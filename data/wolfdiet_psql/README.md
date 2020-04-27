# Postgresql database  

The postgresql backup file contains the standardized relational database of the wolfdiet data. 
For more information about the structure of the wolf diet database see the [WIKI](https://github.com/andreacorra/WolfDiet/wiki) page. The core tables of the database are: 


  * **wolfdiet** Fact table with information on the diet
  * **diet_analysis** Dimension table with information on analysis used to calculate the diet
  * **reference** Dimension table with information on the reviewed study
  * **site** Dimension table with information on the study site
  * **diet_item** Dimension table with information on the diet item

Tables are combined and stored in a user-friendly format provided as **VIEWS**
  * **diet_item_users** table including **(1)** diet_analysis_id and **(2)** the frequency of each diet item. 
  * **diet_item_complete** table including **(1)** diet_analysis_id, **(2)** additional metadata and **(3)** the frequency of each diet item. 

# Restore the database 

1. Download the [backup](https://github.com/andreacorra/wolfdiet/raw/master/data/wolfdiet_psql/wolfdiet_0-2-0.backup) 
2. Open a terminal 
3. Use the following command-line to restore the backup.

## UNIX (macOS/Linux)
``` sql
-- create database
createdb wolfdiet -U postgres
-- restore database 
pg_restore --verbose --no-acl --no-owner -h localhost -U postgres -d wolfdiet ~/Downloads/wolfdiet_0-2-0.backup
``` 

## Windows
In Windows you need to provide the file path and file extension of the functions that are used to restore the database. You can find **create_db** and **pg_restore** in the bin of your postgresql installation. Fill the installed postgresql version in the **'x.x'**.
``` sql
-- create database
c:\program files\PostgreSQL\x.x\bin\createdb.exe wolfdiet -U postgres
-- restore database 
pg_restore.exe --verbose --no-acl --no-owner -h localhost -U postgres -d wolfdiet ~\Downloads\wolfdiet_0-2-0.backup
``` 

# Usage


### SELECT 
``` sql
SELECT * FROM main.diet_analysis;

SELECT * FROM main.diet_item;

SELECT * FROM main.reference;

SELECT * FROM main.site;

SELECT * FROM main.wolfdiet;
``` 

### FILTER 
``` sql
SELECT * FROM main.diet_analysis WHERE sample_size > 10;
``` 

### JOIN 
``` sql
SELECT world_country_description, site.* 
FROM main.site 
JOIN env_data.world_country 
USING (world_country_id);
``` 

### JOIN + FILTER 
``` sql
SELECT world_country_description, site.* 
FROM main.site 
JOIN env_data.world_country 
USING (world_country_id)
WHERE world_country_description = 'Italy';
```

### VIEW 
``` sql
SELECT * FROM main.diet_item_complete;
``` 
