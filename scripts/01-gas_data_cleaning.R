# Load library
library(dplyr)
library(janitor)

# Read the data from the CSV file
data <- read.csv("data/raw_data/Natural gas production by municipality.csv")

# Filter the data for the desired year range
filtered_data <- data %>%
  rename(Year = Period) %>%
  filter(Year >= 2005 & Year <= 2022)

# Calculate sum of gas producion per year
sum_gas <- filtered_data %>%
  group_by(Year) %>%
  summarise(Gas_Production = sum(OriginalValue, na.rm = TRUE)) %>%
  clean_names()

# Save to new CSV file
write.csv(sum_gas, "data/edited_data/sum_gas.csv", row.names = FALSE)

