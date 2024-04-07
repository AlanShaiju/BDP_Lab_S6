# Load necessary libraries
library(caret)

# Read the dataset
data <- read.csv("/home/oem/Alan Shaiju - S6/weatherAUS.csv")
# Check for missing values
missing_values <- colSums(is.na(data))
# Remove rows with missing values
data <- na.omit(data)
# Convert 'RainTomorrow' to numerical format (0 and 1)
data$RainTomorrow <- ifelse(data$RainTomorrow == "Yes", 1, 0)
# Split the data into training and testing sets (70% training, 30% testing)
set.seed(123)  # for reproducibility
train_index <- createDataPartition(data$RainTomorrow, p = 0.7, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]
# Define the logistic regression model
log_model <- glm(RainTomorrow ~ MinTemp + MaxTemp + Rainfall + WindGustSpeed + Humidity9am + Humidity3pm + Pressure9am + Pressure3pm + Temp9am + Temp3pm, 
                 data = train_data, family = "binomial")

# Summarize the model
summary(log_model)

# Predictions on test data
predictions <- predict(log_model, newdata = test_data, type = "response")

# Convert probabilities to binary predictions
predicted_classes <- ifelse(predictions > 0.5, 1, 0)

# Confusion matrix
conf_matrix <- table(test_data$RainTomorrow, predicted_classes)
print(conf_matrix)

# Calculate accuracy
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
print(paste("Accuracy:", accuracy))
