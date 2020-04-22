# FUNCTIONS 
library(roxygen2) # To make R package 
library(devtools) # To make R package 
library(RPostgreSQL) # To access the database 
library(keyring) # To manage passwords 

# DATABASE NAME 
db <- 'wolfdiet'

# RUN ONLY THE FIRST TIME 
# create(wolfdiet) # create package 
# key_set(service=db,username='<username>') # store database password and username to keychain

# EXTRACT DATA FROM DATABASE 
user <- keyring::key_list(db)$username[1]
if(.Platform['OS.type'] == "windows"){
  pw <- keyring::key_get(service=db, username=user) 
} else {
  pw <- keyring::key_get(service=db)
}

con <- dbConnect(drv="PostgreSQL", 
                 dbname='wolfdiet',
                 host='localhost',
                 user=user, 
                 password=pw)

# GET WOLFDIET DATA 
wolfdiet <-dbReadTable(con, c('main','diet_item_complete'))
# GET LOOKUP TABLE DATA 
query<-'SELECT * FROM (SELECT \'altitude_range\' lookup, altitude_range_code code, altitude_range_description description FROM lu_tables.lu_altitude_range
UNION
(SELECT \'analytical_method\',analytical_method_code, analytical_method_description FROM lu_tables.lu_analytical_method)
UNION
(SELECT \'identification_method\',identification_method_code, identification_method_description FROM lu_tables.lu_identification_method)
UNION
(SELECT \'source\',source_code, source_description FROM lu_tables.lu_source)
UNION
(SELECT \'temporal_scale\',temporal_scale_code,temporal_scale_description FROM lu_tables.lu_temporal_scale)
UNION
(SELECT \'type_study\',type_study_code,type_study_description FROM lu_tables.lu_type_study)
UNION
(SELECT \'wolf_population\', wolf_population_code, wolf_population_description FROM lu_tables.lu_wolf_population)
UNION
(SELECT \'wolf_subspecies\', wolf_subspecies_code, wolf_subspecies_description FROM lu_tables.lu_wolf_subspecies)) a 
ORDER BY lookup, code'

# WRITE AS RDA TO GITHUB 
setwd(paste0(getwd(),'/wolfdiet/data'))
save(wolfdiet, file='wolfdiet.rda')
lookup <- dbGetQuery(con, query)
save(lookup, file='lookup.rda')

# WRITE AS CSV TO GITHUB 
setwd('../..')
write.csv(wolfdiet,'data/wolfdiet_csv/wolfdiet.csv')
write.csv(lookup,'data/wolfdiet_csv/lookup.csv')

# UPDATE PACKAGE 
setwd(paste0(getwd(),'/wolfdiet'))
document()
setwd('..')
install('wolfdiet')
library(wolfdiet)

# USE PACKAGE 
data(wolfdiet)
data(lookup)
wolfdiet
lookup

wolfdiet <- wolf(tax=TRUE)
wolfdiet <- wolf(tax=FALSE)




