# Function to perform statistical operations
perform_statistics <- function(data_frame) {
  # Mean
  mean_values <- colMeans(data_frame)
  
  # Median
  median_values <- apply(data_frame, 2, median)
  
  # Quartiles
  quartiles <- apply(data_frame, 2, quantile, probs = c(0.25, 0.75))
  
  # Five number summary
  fivenum_summary <- apply(data_frame, 2, fivenum)
  
  # Boxplot
  boxplot_data <- boxplot(data_frame, main = "Boxplot", col = "lightblue", border = "blue")
  
  # Variance
  variance_values <- apply(data_frame, 2, var)
  
  # Covariance
  covariance_matrix <- cov(data_frame)
  
  # Correlation
  correlation_matrix <- cor(data_frame)
  
  # Output
  cat("Mean:\n", mean_values, "\n\n")
  cat("Median:\n", median_values, "\n\n")
  cat("Quartiles:\n", quartiles, "\n\n")
  cat("Five Number Summary:\n", fivenum_summary, "\n\n")
  cat("Variance:\n", variance_values, "\n\n")
  cat("Covariance Matrix:\n", covariance_matrix, "\n\n")
  cat("Correlation Matrix:\n", correlation_matrix, "\n\n")
  
  # Plot boxplot
  plot(boxplot_data)
}

# Example usage
# Create a sample data frame (replace this with your own data frame)
data <- data.frame(
  x = c(1, 2, 3, 4, 5),
  y = c(6, 7, 8, 9, 10)
)

# Call the function to perform statistical operations
perform_statistics(data)