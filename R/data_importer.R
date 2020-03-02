
# Setting working space
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
rm(list=ls())

library(rpostgis)
library(RPostgreSQL)
library(googlesheets4)
library(rgdal)
library(dplyr)
library(ISOcodes)
library(tidyr)






# Connection to Google Drive and set driver 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
drv <- dbDriver("PostgreSQL") # Establish connection to PoststgreSQL using RPostgreSQL

db_user <- "postgres"
db_password <- "cerrotorre"

sheets_auth() # Authorize googlesheets4 (Access Google Sheets using the Sheets API V4)

con <- dbConnect(drv, dbname="wolfdiet", host="localhost", port=5432, 
                 user= db_user, password= db_password)






# LU_TABLES SCHEMA
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

lu_altitude_range <-
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1Sl5-f9rb3H1S1Mm5JvB6MhRzatIjRbGvdGXg226XWZA/edit#gid=953949673"
    ))
pgInsert(con, name = c("lu_tables", "lu_altitude_range"), lu_altitude_range)



lu_analytical_method <-
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1HdTa7Ahk3wdQzolBuaCxX5FLLGKneftVFdJ2GazqQNc/edit#gid=2112638479"
    ))
pgInsert(con, name = c("lu_tables", "lu_analytical_method"), lu_analytical_method)



lu_identification_method <-
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1OCCCJ6cABnLCFd-hdxpdjv2rbB_n1h2RRgt4oMa1jfQ/edit#gid=16731235"
    ))
pgInsert(con, name = c("lu_tables", "lu_identification_method"), lu_identification_method)

  
  
lu_source <-
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1tHtRJsybhu-llJvPh5Uj5YDSj3UQBBcz8c8sjevJhmI/edit#gid=1054107251"
    ))
pgInsert(con, name = c("lu_tables", "lu_source"), lu_source)



lu_temporal_scale <-
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1HGdUyVSUJpp9YdJbTYVSVS-PqdWIUz4GtT2gaYRNH4o/edit#gid=118555960"
    ))
pgInsert(con, name = c("lu_tables", "lu_temporal_scale"), lu_temporal_scale)



lu_type_study <-
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1avRcpkiAkFxglChJHmUZr5GOQT0nGANZklusJebcW7k/edit#gid=656925142"
    ))
pgInsert(con, name = c("lu_tables", "lu_type_study"), lu_type_study)      



lu_wolf_population <-
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1rvATccGGuWASmSt5Mz14DtAqUHfjXkUqRhiqu3ogKJI/edit#gid=1939313995"
    ))
pgInsert(con, name = c("lu_tables", "lu_wolf_population"), lu_wolf_population)      



lu_wolf_subspecies <-
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/17C2ndQYYh5jn8cHCx3RItBt733v1GnB3FW7QmwAtQmw/edit#gid=1620872909"
    ))
pgInsert(con, name = c("lu_tables", "lu_wolf_subspecies"), lu_wolf_subspecies)      
      
      
      
      


# MAIN SCHEMA
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Load reference into PostgreSQL
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

reference_db <-
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1WyUO1wd-83MIOSz3lB4PedWf_xiNyVsip6IniGZpbmU/edit#gid=1764939781"
    ))
pgInsert(con, name = c("main", "reference"), reference_db)







# Load diet_item into PostgreSQL
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

diet_item_db <- 
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1reVfRgJm06JGhnqVR69h6RKmgX-nd7VDEB26Ft-Gycs/edit#gid=170126488"
    ))

diet_item_db <- 
    diet_item_db[ , c("diet_item_id", "common_name",  "species_name",
                     "distribution_geom", "iucn_status", "year_assessment",
                     "average_weight_kg", "insert_timestamp", "update_timestamp",
                     "notes")]

pgInsert(con, name = c("main", "diet_item"), diet_item_db)






# Load site into PostgreSQL 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


## Load the shapefile "world countries" for gathering information about the sites
world_country <- readOGR("~/Desktop/wolfdiet/spatial_data/world_country/world_country.shp")

head(world_country)

colnames(world_country@data) <-
  c("iso", "world_country_description", "population", 
    "continent", "sub_region" )

# Set Continent
world_country$continent <- as.character(world_country$continent)
world_country$continent[world_country$continent == 2] <- "Africa"
world_country$continent[world_country$continent == 19] <- "Americas"
world_country$continent[world_country$continent == 142] <- "Asia"
world_country$continent[world_country$continent == 150] <- "Europe"
world_country$continent[world_country$continent == 9] <- "Oceania"
world_country$continent[world_country$continent == 0] <- "Antartica"

table(world_country$continent)


# Set Geographic Regions
data("UN_M.49_Regions")
head(UN_M.49_Regions)


table(world_country$continent, world_country$sub_region)

## Add 00 to make the standard 3-digit code
world_country$sub_region <- 
  formatC(
    world_country$sub_region, width = 3, format = "d", flag = "0"
  )

## Assign name based on ISO table
world_country <- 
  merge(world_country, UN_M.49_Regions[,1:2], by.x = "sub_region", by.y = "Code") [, 2:6]

## Assign names
colnames(world_country@data) <-
  c("iso", "world_country_description", "population", 
    "continent", "sub_region" )

world_country$world_country_id <- as.numeric(row.names( world_country )) + 1

world_country@data <- world_country@data[ , c(
  "world_country_id",
  "world_country_description",
  "iso",
  "continent",
  "sub_region",
  "population"
)]


## Insert into PostgreSQL
pgInsert(con, name = c("env_data", "world_country"), world_country, geom = "geom")



## Load site table into PostgreSQL

site_db <- 
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1krqot1INo5erWhnSGVhEY07Fx0Y_KsgwCukzlYPqaUs/edit"
    ))


# site_db <-
#   site_db %>% #better than cumsum(!duplicated(df[2:6])); columns would need to be ordered
#   mutate(
#     site_id = group_indices(
#       ., world_country_id, wolf_population_id, wolf_subspecies_id, study_area, pack
#     )
#   )


## Assign world_country_id as DB identifier
name_countries <- 
  dbGetQuery(con, "SELECT world_country_id as new_world_country_id,
             world_country_description
             FROM env_data.world_country;")

new_world_country_id <-
  merge(site_db, name_countries,
        by.x = "world_country_id", by.y = "world_country_description", sort = F
  )[, c("new_world_country_id")]

site_db$world_country_id <- new_world_country_id
head(site_db)

## Delete site_id repeated 
site_db <- site_db[!duplicated(site_db$site_id),]


# Insert new data into the DB
# dbSendQuery(con, "DELETE FROM main.site;")
pgInsert(con, name = c("main", "site"), site_db, partial.match = TRUE)

# dbSendQuery(con,"UPDATE main.site 
# SET geom = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326);")






# Load diet_analysis into PostgreSQL
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

diet_analysis_db <- 
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1vdi5qh7vYF1fXxvVp45JHTX3MhWYnqnqlV4R-DlF7MM/edit"
    ))

diet_analysis_db$surface_area <- as.integer(diet_analysis_db$surface_area)
pgInsert(con, name = c("main", "diet_analysis"), diet_analysis_db)






# Load wolfdiet into PostgreSQL
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

wolfdiet_raw_db <- 
  as.data.frame(
    read_sheet(
      "docs.google.com/spreadsheets/d/1vgKCtJXBr37Bo66WJ6xnlEYZ3uGwFdJH9srUdcIrx5A/edit#gid=2030649042"
    ))


# Assign diet_item_id to each diet item in the diet (i.e. common name)
diet_item <- dbGetQuery(con,"SELECT diet_item_id, common_name FROM main.diet_item;")
speciess <- setNames( as.data.frame( colnames(wolfdiet_raw_db)[4:76] ), "speciess")

merged <- merge(speciess, diet_item, by.x = "speciess", by.y = "common_name", sort = F)
diet_item_id <- as.character(merged[,2])

colnames(wolfdiet_raw_db)[4:76] <- diet_item_id


# convert wolfdiet from wide to long

long_table <-
  as.data.frame(
    pivot_longer(
      data = wolfdiet_raw_db,
      cols = 4:76,
      names_to = "diet_item_id",
      values_to = "diet_item_frequency"
    ))

# spread(long_table, diet_item_id, diet_item_frequency)

wolfdiet_db <- long_table[order(long_table$diet_analysis_id), ]
wolfdiet_db <- wolfdiet_db[ !is.na(wolfdiet_db$diet_item_frequency) , ]

row.names(wolfdiet_db)  <- 1:nrow(wolfdiet_db)
wolfdiet_db$wolfdiet_id <- 1:nrow(wolfdiet_db)


head(wolfdiet_db)
str(wolfdiet_db)


pgInsert(con, name = c("main", "wolfdiet"), wolfdiet_db)
# dbSendQuery(con, "DELETE FROM main.wolfdiet;")

dbDisconnect(con)






# ENV_DATA SCHEMA
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Load iucn_species_distribution into PostgreSQL
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
setwd("~/data")
iucn_species_distribution <- readOGR("all_species.shp")

colnames(iucn_species_distribution@data) <-
  c("compiler", "year", "citation", "legend", "filename", "presence",
    "origin", "seasonal", "iucn_species_id", "iucn_species_name"
  )

iucn_species_distribution@data <- iucn_species_distribution@data[, c(
  "iucn_species_id",
  "iucn_species_name",
  "presence",
  "origin",
  "seasonal",
  "compiler",
  "year",
  "citation",
  "legend",
  "filename"
)]

head(iucn_species_distribution@data)

pgInsert(con, name = c("env_data", "iucn_species_distribution"), 
         iucn_species_distribution, geom = "geom", partial.match = TRUE)


# dbSendQuery(con, "ALTER TABLE env_data.iucn_species_distribution 
#           ADD CONSTRAINT iucn_species_distribution_pkey PRIMARY KEY (iucn_species_id);
#           GRANT ALL ON TABLE env_data.iucn_species_distribution TO postgres;
#           COMMENT ON TABLE env_data.iucn_species_distribution
#             IS 'Dimension table with information on analysis used to calculate the diet';
#           COMMENT ON COLUMN env_data.iucn_species_distribution.iucn_species_id
#             IS 'database identifier for the species';
#           COMMENT ON COLUMN env_data.iucn_species_distribution.iucn_species_name
#             IS 'scientific name of the species';
#           COMMENT ON COLUMN env_data.iucn_species_distribution.presence
#             IS 'presence of the species';
#           COMMENT ON COLUMN env_data.iucn_species_distribution.origin
#             IS 'origin of the species';
#           COMMENT ON COLUMN env_data.iucn_species_distribution.seasonal
#             IS 'seasonal distribution of the species';
#           COMMENT ON COLUMN env_data.iucn_species_distribution.compiler
#             IS 'compiler of the species information';
#           COMMENT ON COLUMN env_data.iucn_species_distribution.year
#             IS 'year of assessment';
#           COMMENT ON COLUMN env_data.iucn_species_distribution.citation
#             IS 'citation to use when referencing species data';
#           COMMENT ON COLUMN env_data.iucn_species_distribution.legend
#             IS 'summary information on species distribution';
#           COMMENT ON COLUMN env_data.iucn_species_distribution.geom
#             IS 'geometry of the species distribution (area)';
#           COMMENT ON COLUMN env_data.iucn_species_distribution.filename
#             IS 'identifying name given to the layer';")

dbDisconnect(con)


