# Load required libraries
library(ggplot2)
library(reshape2)

# Create a sample correlation matrix
set.seed(123)
n <- 5
cor_matrix <- matrix(runif(n^2), n, n)
diag(cor_matrix) <- 1
cor_matrix

# Melt the correlation matrix for plotting
melted_cor_matrix <- melt(cor_matrix)

# Create a heatmap using ggplot2
heatmap_plot <- ggplot(melted_cor_matrix, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(title = "Correlation Heatmap") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Display the heatmap
print(heatmap_plot)
