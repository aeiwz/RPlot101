# Load required libraries
library(ggplot2)

# Create a sample dataset
set.seed(123)
data <- data.frame(
  Values = rnorm(100, mean = 5, sd = 2)
)

# Create a histogram using ggplot2
histogram <- ggplot(data, aes(x = Values)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram Example", x = "Values", y = "Frequency") +
  theme_minimal()

# Display the histogram
print(histogram)
