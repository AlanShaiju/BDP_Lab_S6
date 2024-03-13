# Load necessary libraries
# Install ggplot2 package from CRAN (Comprehensive R Archive Network)
library(ggplot2)
library(lattice)

# Load the dataset
air_quality <- read.csv("C:/Users/Alan Shaiju/OneDrive/Desktop/BDP Lab/city_day.csv")

# Remove rows with missing values
air_quality <- na.omit(air_quality)

# Check the structure of the dataset
str(air_quality)

# Check for missing values
sum(is.na(air_quality))

# Summary statistics
summary(air_quality)

# Plot AQI vs other variables
# Using ggplot2 for PM2.5
ggplot(air_quality, aes(x = PM2.5, y = AQI)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "PM2.5", y = "AQI", title = "AQI vs PM2.5 (ggplot2)")

# Using lattice for PM2.5
xyplot(AQI ~ PM2.5, data = air_quality,
       xlab = "PM2.5", ylab = "AQI",
       main = "AQI vs PM2.5 (lattice)",
       type = c("p", "r"))

# Perform multiple linear regression
model <- lm(AQI ~ PM2.5 + PM10 + NO + NO2 + NOx + NH3 + CO + SO2 + O3 + Benzene + Toluene + Xylene, data = air_quality)

# Summary of the model
summary(model)

# Predict AQI using the model
predictions <- predict(model, air_quality)

# Evaluate the performance of the model
# Calculate R-squared
rsquared <- cor(air_quality$AQI, predictions)^2
cat("R-squared:", rsquared, "\n")

# Calculate RMSE (Root Mean Squared Error)
rmse <- sqrt(mean((air_quality$AQI - predictions)^2))
cat("RMSE:", rmse, "\n")

# Calculate MAE (Mean Absolute Error)
mae <- mean(abs(air_quality$AQI - predictions))
cat("MAE:", mae, "\n")
