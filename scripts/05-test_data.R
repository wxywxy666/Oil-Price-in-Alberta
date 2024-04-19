data <- read.csv("data/edited_data/merged_data.csv")

# Test 1: Check if the Year is a positive integer
test1 <- all(data$year == as.integer(data$year) & data$year > 0)
print(paste("Test 1 - Year is a positive integer:", test1))

# Test 2: Check if the Year is within the range of 2005 to 2024
test2 <- all(data$year >= 2005 & data$year <= 2024)
print(paste("Test 2 - Year within 2005-2024:", test2))

# Test 3: Check if Gas Production is a positive number
test3 <- all(data$gas_production > 0)
print(paste("Test 3 - Gas Production is positive:", test3))

# Test 4: Check if Well Counts is a non-negative integer
test4 <- all(data$well_counts == as.integer(data$well_counts) & data$well_counts >= 0)
print(paste("Test 4 - Well Counts is a non-negative integer:", test4))

# Test 5: Check if Oil Price is a positive number
test5 <- all(data$oil_price > 0)
print(paste("Test 5 - Oil Price is positive:", test5))

# Test 6: Ensure all entries in the dataset have no missing values
test6 <- all(complete.cases(data))
print(paste("Test 6 - No missing values in the data:", test6))

