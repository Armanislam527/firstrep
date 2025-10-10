# Lab 20: Perform z-Tests for Large Sample Sizes
# Generate sample data
library(BSDA)
set.seed(123)
group1 <- rnorm(100, mean = 5, sd = 2)
group2 <- rnorm(100, mean = 6, sd = 2)
# Perform z-test
z_test_result <- z.test(group1, group2, sigma.x = sd(group1), sigma.y = sd(group2))
# Output
print(z_test_result)
# Graphical Output
par(mfrow = c(1, 2))
# Histogram of groups
hist(group1, breaks = 30, col = "lightblue", main = "Histogram of Group 1", xlab = "Value", border = "white")
hist(group2, breaks = 30, col = "lightgreen", main = "Histogram of Group 2", xlab = "Value", border = "white")