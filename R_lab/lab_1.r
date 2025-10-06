# Define population parameters and simulation settings
mu <- 50       # Population mean (mu)
sigma <- 10    # Population standard deviation (sigma)
n <- 30        # Sample size
N_sim <- 1000  # Number of simulations

# Initialize vectors to store results
sample_means <- numeric(N_sim)
sample_vars <- numeric(N_sim)

# Set seed for reproducibility
set.seed(123)

# Simulation loop
for (i in 1:N_sim) {
  # Generate a sample of size n from a normal distribution
  data <- rnorm(n = n, mean = mu, sd = sigma)

  # Store the sample mean and sample variance
  sample_means[i] <- mean(data)
  sample_vars[i] <- var(data)
}

# Calculate the correlation between sample mean and sample variance
correlation <- cor(sample_means, sample_vars)

# Print the correlation value
print(paste("Correlation between sample mean and sample variance:", correlation))

# Graphical output
par(mfrow = c(2, 2)) # Divide the plotting area into a 2x2 grid

# Histogram of sample means
hist(sample_means, breaks = 30, col = "lightblue",
     main = "Distribution of Sample Means",
     xlab = "Sample Mean", border = "white")
# Overlay the theoretical normal density curve
curve(dnorm(x, mean = mu, sd = sigma / sqrt(n)), add = TRUE, col = "red", lwd = 2)

# Histogram of sample variances
hist(sample_vars, breaks = 30, col = "lightgreen",
     main = "Distribution of Sample Variances",
     xlab = "Sample Variance", border = "white")
# Overlay the theoretical chi-squared density curve scaled for sample variance
# Note: The distribution of (n-1)*s^2/sigma^2 is chi-squared with n-1 degrees of freedom.
# The curve shows the scaled density for the sample variance s^2.
curve(dchisq(x * (n - 1) / sigma^2, df = n - 1) * (n - 1) / sigma^2, add = TRUE, col = "blue", lwd = 2)
# Add a vertical line for the true population variance
abline(v = sigma^2, col = "red", lwd = 2, lty = 2)

# Scatterplot of sample means vs. sample variances
plot(sample_means, sample_vars, pch = 19, col = "blue",
     main = "Sample Mean vs. Sample Variance",
     xlab = "Sample Mean", ylab = "Sample Variance")
# Add a horizontal line for the true population variance
abline(h = sigma^2, col = "red", lwd = 2)

# Q-Q plot for sample means
qqnorm(sample_means, main = "Normal Q-Q Plot for Sample Means", col = "blue")
qqline(sample_means, col = "red", lwd = 2)
