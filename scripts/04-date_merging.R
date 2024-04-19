# Read 3 cleaned data
data1 <- read.csv("data/edited_data/avg_price.csv")
data2 <- read.csv("data/edited_data/sum_gas.csv")
data3 <- read.csv("data/edited_data/sum_wells.csv")

# Merge them together
merged_data <- merge(merge(data2, data3, by = "year"), data1, by = "year")

# Save to new CSV file
write.csv(merged_data, "data/edited_data/merged_data.csv", row.names = FALSE)
