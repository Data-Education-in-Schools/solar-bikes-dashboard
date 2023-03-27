library(dplyr)
library(readr)
library(here)

# specify folders where the input data file is and the output data files should be written  to
output_data_dir <- here("data", "output")

# import the dataset containing bike journeys
bikes <- read_csv("https://datasets.learn-data.science/bikes.csv")

# create a dataset with 1 row per station
stations <- bikes %>% 
  # select unique combinations
  distinct(start_station_id, start_station_name, start_station_description,
           start_station_latitude, start_station_longitude) %>% 
  # remove the "start_" prefix from all column headers
  rename_with(.fn = ~ gsub("start_", "", .x, fixed = TRUE), .col = everything()) %>% 
  # order by station_id
  arrange(station_id)
  
# Write the dataset to disk 
write_csv(stations, here(output_data_dir, "stations.csv"))

# The dataset can also be downloaded from https://datasets.learn-data.science/stations.csv

# create a dataset that summarises each combination of start and end station and 
# counts the number of journeys from the start to the end station.
bikes_routes <- bikes %>% 
  # select only the variables needed to draw the map 
  select(start_station_id, start_station_name, start_station_latitude, start_station_longitude,
         end_station_id, end_station_name, end_station_latitude, end_station_longitude) %>% 
  # how many journeys were there between the start and end station? 
  group_by(start_station_id, end_station_id) %>% 
  # n() is the number of rows in each group
  mutate(num_journeys = n()) %>% 
  # each row should be unique
  distinct(start_station_id, end_station_id, .keep_all = TRUE) 

# Write the dataset to disk   
write_csv(bikes_routes, here(output_data_dir, "bike_routes.csv"))

# The dataset can also be downloaded from https://datasets.learn-data.science/bike_routes.csv

