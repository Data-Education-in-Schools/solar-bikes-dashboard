# SOLAR Dashboard Assessment


This repo contains code to prepare data for the SOLAR assessment for the NPA in Data Science which asks learners to create an interactive dashboard using Just Eat bikes data.

This data can then be imported into the [flourish](https://flourish.studio/) data visualisation tool to create a dashboard.

The file `reshape_bikes.R` creates two datasets using the original `bikes.csv` data:

* `stations.csv`: a dataset containing 1 row per station, and including descriptive and location data for each station 
* `bike_routes.csv`: a dataset that summarises each combination of start and end station with a count of the number of journeys from the start to the end station.

The output datasets are written to the `./data/output/` folder.
