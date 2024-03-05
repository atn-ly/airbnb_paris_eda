#### Preamble ####
# Purpose: Downloads and saves the data from Airbnb
# Author: Tam Ly
# Date: 5 March 2024
# Contact: annatn.ly@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)

#### Download data ####
url <-
  paste0(
    "http://data.insideairbnb.com/france/ile-de-france/paris/2023-12-12/data/listings.csv.gz"
  )

airbnb_data <-
  read_csv(
    file = url,
    guess_max = 20000
  )

#### Save data ####
write_csv(airbnb_data, "airbnb_data.csv")


#### Create a parquet file with selected variables ####
airbnb_data_selected <-
  airbnb_data |>
  select(
    host_id,
    host_response_time,
    host_is_superhost,
    host_total_listings_count,
    neighbourhood_cleansed,
    bathrooms,
    bedrooms,
    price,
    number_of_reviews,
    review_scores_rating,
    review_scores_accuracy,
    review_scores_value
  )

write_parquet(
  x = airbnb_data_selected, 
  sink = 
    "2024-12-12-paris-airbnblistings-select_variables.parquet"
)

rm(airbnb_data)
