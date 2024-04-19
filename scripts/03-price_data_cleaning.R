# Load library
library(dplyr)
library(lubridate)
library(janitor)

# Read the data from the CSV file
data <- read.csv("data/raw_data/WCS Oil Price.csv")

# Filter for 'WCS' series and the desired year range
filtered_data <- data %>%
  filter(Series == "WCS") %>%
  mutate(Year = year(as.Date(Date))) %>%
  filter(Year >= 2005 & Year <= 2022)

# Calculate average price per year
avg_price <- filtered_data %>%
  group_by(Year) %>%
  summarise(Oil_Price = round(mean(Value, na.rm = TRUE), 2)) %>%
  clean_names()

# Save to new CSV file
write.csv(avg_price, "data/edited_data/avg_price.csv", row.names = FALSE)
