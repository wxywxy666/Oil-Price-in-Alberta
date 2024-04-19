# Set seed for reproducibility
set.seed(888)

# Create a data frame
simulated_data <- data.frame(
  Year = 2005:2024,
  Gas_Production = round(runif(20, min = 100000, max = 200000), 0), # Random values between 100,000 and 200,000
  Well_Counts = sample(500:2000, 20, replace = TRUE), # Random sampling of well counts between 500 and 2000
  Oil_Price = round(runif(20, min = 50, max = 120), 2) # Random oil prices between $50 and $120 per barrel
)

# View the head of the dataset to check its structure
head(simulated_data)
