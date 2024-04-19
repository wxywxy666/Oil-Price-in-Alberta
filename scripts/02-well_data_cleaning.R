# Load library
library(dplyr)
library(janitor)

# Read the data from the CSV file
data <- read.csv("data/raw_data/Well count by municipality.csv")

# Filter the data for the desired year range
filtered_data <- data %>%
  rename(Year = Period) %>%
  filter(Year >= 2005 & Year <= 2022)

# Calculate sum of well counts per year
sum_wells <- filtered_data %>%
  group_by(Year) %>%
  summarise(Well_Counts = sum(OriginalValue, na.rm = TRUE)) %>%
  clean_names()

# Save to new CSV file
write.csv(sum_wells, "data/edited_data/sum_wells.csv", row.names = FALSE)

