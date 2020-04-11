library(datamodelr)
library(DiagrammeR)
library(dplyr)


## Fact table // main
wolfdiet <- data.frame(
  wolfdiet_id = NA,
  diet_analysis_id = NA,
  site_id = NA,
  diet_item_id = NA,         
  diet_item_frequency = NA,  
  insert_timestamp = NA,
  update_timestamp = NA,
  notes = NA,
  responsible = NA,
  reference_id = NA
)

## Primary dimension tables // main
diet_analysis <- data.frame(
  diet_analysis_id = NA,	
  source_id = NA,
  analytical_method_id = NA,
  identification_method_id = NA,
  temporal_scale_id = NA,
  derived_diet = NA,
  sample_size = NA,
  surface_area = NA,
  sampling_period = NA,
  time_series = NA,
  spatial_effort = NA,
  temporal_effort = NA,
  total_effort = NA,
  insert_timestamp = NA,
  update_timestamp = NA,
  notes = NA
)

site <- data.frame(
  site_id = NA,
  world_countries_id = NA,
  wolf_population_id = NA,
  wolf_subspecies_id = NA,
  study_area = NA,
  pack = NA,
  geom_centroid = NA,
  geom_area = NA,
  latitude = NA,
  longitude = NA,
  altitude_range_id = NA,
  world_dem = NA,
  world_biome_id = NA,
  world_climate_id = NA,
  world_human_settlement = NA,
  world_human_footprint = NA,
  insert_timestamp = NA,
  update_timestamp = NA,
  notes = NA
)

reference <- data.frame(
  reference_id = NA,
  publication_year = NA,
  type_study_id = NA,
  original_language = NA,
  doi = NA,
  link = NA,
  insert_timestamp = NA,
  update_timestamp = NA,
  notes = NA
)


diet_item <- data.frame(
  diet_item_id = NA,
  common_name = NA,
  species_name = NA,
  distribution_geom = NA,
  iucn_status = NA,
  year_assessment = NA,
  average_weigth = NA,
  insert_timestamp = NA,
  update_timestamp = NA,
  notes = NA
)



## Secondary dimension tables // look up table 
lu_source <- data.frame(
  source_id = NA,
  source_description = NA
)

lu_analytical_method <- data.frame(
  analytical_method_id = NA,
  analytical_method_description = NA
)

lu_identification_method <- data.frame(
  identification_method_id = NA,
  identification_method_description = NA
)

lu_temporal_scale <- data.frame(
  temporal_scale_id = NA,
  temporal_scale_description = NA
)

lu_type_study <- data.frame(
  type_study_id = NA,
  type_study_description = NA
)

lu_wolf_population <- data.frame(
  wolf_population_id = NA,
  wolf_population_description = NA
)

lu_wolf_subspecies <- data.frame(
  wolf_subspecies_id = NA,
  wolf_subspecies_description = NA,
  average_weigth = NA
)

lu_altitude_range <- data.frame(
  altitude_range_id = NA,
  altitude_range_description = NA
)

## Environmental, socio-economic and species range tables // env_data
world_countries <- data.frame( # definition of columns to do
  world_countries_id = NA,
  world_countries_description = NA,
  iso = NA,
  continent = NA,
  geom = NA,
  filename = NA
)

world_dem <- data.frame( # definition of columns to do
  world_dem = NA,
  rast = NA,
  filename = NA
)

world_biome <- data.frame( # definition of columns to do
  world_biome_id = NA,
  world_biome_description = NA,
  eco_code = NA,
  geom = NA,
  filename = NA
)

world_climate <- data.frame( # definition of columns to do
  world_climate_id = NA,
  world_climate_description = NA,
  koppen_code = NA,
  geom = NA,
  filename = NA
)

world_human_settlement <- data.frame( # definition of columns to do
  world_human_settlement = NA,
  rast = NA,
  filename = NA
)

world_human_footprint <- data.frame( # definition of columns to do
  world_human_footprint = NA,
  rast = NA,
  filename = NA
)




## Create data model object from R data frames
dm_f <- dm_from_data_frames(
  wolfdiet,
  diet_analysis,
  site,
  reference,
  diet_item,
  lu_source,
  lu_analytical_method,
  lu_identification_method,
  lu_temporal_scale,
  lu_type_study,
  lu_wolf_population,
  lu_wolf_subspecies,
  lu_altitude_range,
  world_countries,
  world_dem,
  world_biome,
  world_climate,
  world_human_settlement,
  world_human_footprint
)


## Set column as a primary keys
dm_f <- dm_f %>%
  dm_set_key("wolfdiet", "wolfdiet_id") %>%
  dm_set_key("diet_analysis", "diet_analysis_id") %>%
  dm_set_key("site", "site_id") %>%
  dm_set_key("reference", "reference_id") %>%
  dm_set_key("diet_item", "diet_item_id") %>%
  dm_set_key("lu_source", "source_id") %>%
  dm_set_key("lu_analytical_method", "analytical_method_id") %>%
  dm_set_key("lu_identification_method", "identification_method_id") %>%
  dm_set_key("lu_temporal_scale", "temporal_scale_id") %>%
  dm_set_key("lu_type_study", "type_study_id") %>%
  dm_set_key("lu_wolf_population", "wolf_population_id") %>%
  dm_set_key("lu_wolf_subspecies", "wolf_subspecies_id") %>%
  dm_set_key("lu_altitude_range", "altitude_range_id") %>%
  dm_set_key("world_countries", "world_countries_id") %>%
  dm_set_key("world_dem", "world_dem") %>%
  dm_set_key("world_biome", "world_biome_id") %>%
  dm_set_key("world_climate", "world_climate_id") %>%
  dm_set_key("world_human_settlement", "world_human_settlement") %>%
  dm_set_key("world_human_footprint", "world_human_footprint")



## Adds references defined with logical expressions from data frames
dm_f <- dm_f %>%
  dm_add_references(
    wolfdiet$diet_analysis_id == diet_analysis$diet_analysis_id,
    wolfdiet$site_id  == site$site_id,
    wolfdiet$reference_id == reference$reference_id,
    wolfdiet$diet_item_id == diet_item$diet_item_id,
    diet_analysis$source_id == lu_source$source_id,
    diet_analysis$analytical_method_id == lu_analytical_method$analytical_method_id,
    diet_analysis$identification_method_id == lu_identification_method$identification_method_id,
    diet_analysis$temporal_scale_id == lu_temporal_scale$temporal_scale_id,
    diet_analysis$type_study_id == lu_type_study$type_study_id,
    site$wolf_population_id == lu_wolf_population$wolf_population_id,
    site$wolf_subspecies_id == lu_wolf_subspecies$wolf_subspecies_id,
    site$altitude_range_id == lu_altitude_range$altitude_range_id,
    site$world_countries_id == world_countries$world_countries_id,
    site$world_dem == world_dem$world_dem,
    site$world_biome_id == world_biome$world_biome_id,
    site$world_climate_id == world_climate$world_climate_id,
    site$world_human_settlement == world_human_settlement$world_human_settlement,
    site$world_human_footprint == world_human_footprint$world_human_footprint,
    reference$type_study_id == lu_type_study$type_study_id
  )


## Set tables' display in a data model
display_col <- list(
  accent1 = c("wolfdiet"),
  accent2 = c("diet_analysis", "site", "reference", "diet_item"),
  accent3 = c(
    "lu_source",
    "lu_analytical_method",
    "lu_identification_method",
    "lu_temporal_scale",
    "lu_type_study",
    "lu_wolf_population",
    "lu_wolf_subspecies",
    "lu_altitude_range"
  ),
  accent4 = c(
    "world_countries",
    "world_dem",
    "world_biome",
    "world_climate",
    "world_human_settlement",
    "world_human_footprint"
  )
)

dm_f <- dm_set_display(dm_f, display_col)


## Set table segment
table_segments <- list(
  main = c("wolfdiet", "diet_analysis", "site", "reference", "diet_item"),
  lu_tables = c("lu_source",
                "lu_analytical_method",
                "lu_identification_method",
                "lu_temporal_scale",
                "lu_type_study",
                "lu_wolf_population",
                "lu_wolf_subspecies",
                "lu_altitude_range"
  ),
  env_data = c("world_countries",
               "world_dem",
               "world_biome",
               "world_climate",
               "world_human_settlement",
               "world_human_footprint")
)

dm_f <- dm_set_segment(dm_f, table_segments)


## Create a graph object from data model object
graph <-
  dm_create_graph(dm_f,
                  rankdir = "RL", # rankdir=TB|RL|BT
                  col_attr = c("column"),
                  view_type = "all",
                  edge_attrs = "dir = both, arrowtail = crow, arrowhead = odiamond")


## Finally, the graph is rendered
dm_render_graph(graph)

## TO SAVE ##
# open image in HTML
# move the screen vertically (Ctrl + Alt + arrow)
# clip image