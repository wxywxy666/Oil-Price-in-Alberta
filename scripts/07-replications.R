#### Preamble ####
# Purpose: Models Record
# Author: Xiyou Wang
# Date: 19 April 2024
# Contact: xiyou.wang@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(here)
library(tidyverse)
library(knitr)
library(kableExtra)
library(ggplot2)
library(corrplot)
library(car)
library(Metrics)
library(broom)
library(performance)


#### Load data ####
data <- read.csv(here::here("data/edited_data/merged_data.csv"))

kable(head(data, 10)) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F, font_size = 14) %>%
  column_spec(1, bold = T, color = "black") %>%
  row_spec(0, bold = T, background = "#D3D3D3")

ggplot(data, aes(x = well_counts, y = gas_production)) +
  geom_point(aes(color = well_counts), alpha = 0.6, size = 3) +
  geom_smooth(method = "lm", color = "blue", se = TRUE) +
  labs(x = "Number of Wells",
       y = "Gas Production (cubic meters)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "none")

# Scatter plot for Gas_Production vs Oil_Price
ggplot(data, aes(x=gas_production, y=oil_price)) + 
  geom_point() + 
  geom_smooth(method='lm', formula = y ~ x, color="blue") +
  labs(x="Gas Production", y="Oil Price")

# Scatter plot for Well_Counts vs Oil_Price
ggplot(data, aes(x=well_counts, y=oil_price)) + 
  geom_point() + 
  geom_smooth(method='lm', formula = y ~ x, color="blue") +
  labs(x="Well Counts", y="Oil Price")

correlations <- cor(data[, c("gas_production", "well_counts", "oil_price")])

kable(correlations, format = "latex", booktabs = TRUE) %>%
  kable_styling(latex_options = c("striped", "scale_down"), font_size = 10) %>%
  column_spec(1, bold = TRUE, border_right = TRUE) %>%
  row_spec(0, bold = TRUE, background = "#F7F7F7") %>%
  add_header_above(c(" " = 1, "Variables" = 3))

# Correlation matrix plot
corrplot(correlations, method="circle")

# Build the model
model <- lm(oil_price ~ gas_production + well_counts, data=data)

model_summary <- bind_rows(tidy(model), performance::performance(model))

kable(model_summary, format = "latex", booktabs = TRUE) %>%
  kable_styling(latex_options = c("striped", "scale_down")) %>%
  row_spec(0, bold = TRUE, background = "#D3D3D3")

# Diagnostic plots for residuals
plot(model)

# Predicted vs Actual plot
ggplot(data, aes(x=predict(model, data), y=oil_price)) +
  geom_point() +
  geom_abline(intercept=0, slope=1, linetype="dashed", color="red") +
  labs(x="Predicted Oil Price", y="Actual Oil Price")