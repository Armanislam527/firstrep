# Apply Bartlett’s test to compare variances across multiple groups.
# Generate sample data for three groups
set.seed(123)
group1 <- rnorm(30, mean = 5, sd = 2)
group2 <- rnorm(30, mean = 5, sd = 3)
group3 <- rnorm(30, mean = 5, sd = 4)

# Combine data into a data frame for Bartlett's test
data_values <- c(group1, group2, group3)
group_labels <- rep(c("Group 1", "Group 2", "Group 3"), each = 30)

# Perform Bartlett's test
bartlett_test_result <- bartlett.test(data_values ~ group_labels)

# Output test result
print(bartlett_test_result)

# Graphical Output
par(mfrow = c(1, 2))

# Boxplot of groups
boxplot(group1, group2, group3, col = c("lightblue", "lightgreen", "lightcoral"), main = "Boxplot of Groups", names = c("Group 1", "Group 2", "Group 3"), xlab = "Group", ylab = "Value")

# Density plots of groups
plot(density(group1), col = "blue", lwd = 2, main = "Density Plots", xlab = "Value", ylim = c(0, 0.25))
lines(density(group2), col = "green", lwd = 2)
lines(density(group3), col = "red", lwd = 2)

# Add legend
legend("topright", legend = c("Group 1", "Group 2", "Group 3"), col = c("blue", "green", "red"), lwd = 2)
