library(partykit)
data(iris)
set.seed(123)
train_index <- sample(1:nrow(iris), 0.9 * nrow(iris))
train_data <- iris[train_index, ]
test_data <- iris[-train_index, ]

# Create the conditional inference tree
ctree_model <- ctree(Species ~ ., data = train_data)

# Print the conditional inference tree
print(ctree_model)

# Plot the conditional inference tree
plot(ctree_model)

# Make predictions on the test data
predictions <- predict(ctree_model, newdata = test_data)

# Print the predictions
print(predictions)

