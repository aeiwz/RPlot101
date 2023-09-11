# Load required libraries
library(ggplot2)
library(cluster)

# Generate some sample data with two distinct clusters
set.seed(123)
data <- data.frame(
  x = c(rnorm(50, mean = 3), rnorm(50, mean = 8)),
  y = c(rnorm(50, mean = 3), rnorm(50, mean = 8))
)

# Perform K-Means clustering with 2 clusters
kmeans_result <- kmeans(data, centers = 2)

# Add cluster assignments to the original dataset
data$cluster <- factor(kmeans_result$cluster)

# Plot the data points with cluster colors
ggplot(data, aes(x, y, color = cluster)) +
  geom_point() +
  labs(title = "K-Means Clustering Example") +
  theme_minimal()
