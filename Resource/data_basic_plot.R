# Sample data for a bar chart
categories <- c("Category A", "Category B", "Category C", "Category D")
values <- c(25, 40, 15, 30)


# Sample data for a box plot
group1 <- rnorm(100, mean = 0, sd = 1)
group2 <- rnorm(100, mean = 2, sd = 1)
data <- list(Group1 = group1, Group2 = group2)


# Sample data for a line plot
time <- 1:10
values <- c(3, 5, 7, 4, 8, 9, 6, 10, 12, 11)


# Sample data for a scatter plot
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 1, 6, 3)


# Sample data for a pie chart
categories <- c("Category A", "Category B", "Category C")
values <- c(30, 40, 15)



# Load the ggplot2 package
library(ggplot2)

# Sample data for all plots
# You can replace this with your own data
set.seed(123)
data <- data.frame(
  Category = c("A", "B", "C", "D"),
  Value = c(25, 40, 15, 30),
  Group1 = rnorm(100, mean = 0, sd = 1),
  Group2 = rnorm(100, mean = 2, sd = 1),
  Time = 1:10,
  Values = c(3, 5, 7, 4, 8, 9, 6, 10, 12, 11),
  X = c(1, 2, 3, 4, 5),
  Y = c(2, 4, 1, 6, 3),
  Label = c("Category A", "Category B", "Category C"),
  Percentage = c(30, 40, 15)
)

# Create a bar chart using ggplot2
bar_plot <- ggplot(data, aes(x = Category, y = Value, fill = Category)) +
  geom_bar(stat = "identity") +
  labs(title = "Bar Chart Example")

# Create a box plot using ggplot2
box_plot <- ggplot(data, aes(x = factor(1), y = Group1)) +
  geom_boxplot() +
  labs(title = "Box Plot Example")

# Create a line plot using ggplot2
line_plot <- ggplot(data, aes(x = Time, y = Values)) +
  geom_line() +
  labs(title = "Line Plot Example")

# Create a scatter plot using ggplot2
scatter_plot <- ggplot(data, aes(x = X, y = Y)) +
  geom_point() +
  labs(title = "Scatter Plot Example")

# Create a pie chart using ggplot2 (requires some data transformation)
pie_chart_data <- data %>%
  group_by(Label) %>%
  summarise(Percentage = sum(Percentage))

pie_chart <- ggplot(pie_chart_data, aes(x = "", y = Percentage, fill = Label)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Pie Chart Example") +
  theme_void()

# Display the plots
print(bar_plot)
print(box_plot)
print(line_plot)
print(scatter_plot)
print(pie_chart)


