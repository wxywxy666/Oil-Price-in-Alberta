#### Preamble ####
# Purpose: Models Record
# Author: Xiyou Wang
# Date: 19 April 2024
# Contact: xiyou.wang@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/edited_data/merged_data.csv")

### Model data ####
first_model <-
  stan_glm(
    formula = oil_price ~ well_counts + gas_production,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  first_model,
  file = "models/model.rds"
)
