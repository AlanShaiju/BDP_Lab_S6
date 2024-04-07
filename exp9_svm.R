library(e1071)
data(mtcars)
mtcars$mpg_high <- ifelse(mtcars$mpg > median(mtcars$mpg), 1, 0)
set.seed(123)  
train_index <- sample(1:nrow(mtcars), 0.7 * nrow(mtcars))
train_data <- mtcars[train_index, ]
test_data <- mtcars[-train_index, ]
svm_model <- svm(mpg_high ~ ., data = train_data, kernel = "linear")
predictions <- predict(svm_model, newdata = test_data)
print(predictions)
predicted_classes <- ifelse(predictions > 0.5, 1, 0)
print(predicted_classes)