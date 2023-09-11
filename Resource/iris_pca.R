# Load a built-in dataset (Iris dataset)
data(iris)

# Separate the features (variables) from the target variable (species)
features <- iris[, 1:4]
target <- iris$Species

# Perform PCA on the features
pca_result <- prcomp(features, scale = TRUE)

# Summary of the PCA results
summary(pca_result)

# Plot the cumulative proportion of variance explained by each principal component
plot(cumsum(pca_result$sdev^2) / sum(pca_result$sdev^2), 
     xlab = "Number of Principal Components",
     ylab = "Cumulative Proportion of Variance Explained",
     type = "b")

# Scree plot to visualize the variance explained by each principal component
screeplot(pca_result, type = "lines")

# Biplot to visualize the loadings and scores of the first two principal components
biplot(pca_result, scale = 0)

# Access the principal components
pc1 <- pca_result$x[, 1]
pc2 <- pca_result$x[, 2]

# Plot the data in the reduced PCA space (first two principal components)
plot(pc1, pc2, col = as.integer(target), pch = 19, 
     main = "PCA of Iris Dataset (PC1 vs. PC2)",
     xlab = "Principal Component 1",
     ylab = "Principal Component 2")
legend("topright", legend = levels(target), col = 1:3, pch = 19)
