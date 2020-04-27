# postgresql backup file  

The postgresql backup file contains the standardized relational database of the wolf diet data. 
For more information about the structure of the wolf diet database see the wiki-page.

  * **wolfdiet** table including all diet analysis
  * **lookup** table explaining abbreviations

# Installation 

1. Download this [zip file](https://github.com/andreacorra/wolfdiet/raw/master/data/wolfdiet_R/wolfdiet.zip) 
2. Then use this file to install the R-package

``` sql
CREATE DATABASE wolfdiet
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
``` 

# Usage


### SELECT 
``` sql

``` 


### FILTER 
``` sql

``` 


### JOIN 
``` sql

``` 


### VIEW 
``` sql

``` 
