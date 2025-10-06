# Define population parameters and simulation settings
mu <- 0         # Population mean (mu)
sigma <- 1      # Population standard deviation (sigma)
n <- 20         # Sample size
N_sim <- 1000   # Number of simulations

# Initialize vectors to store results
medians <- numeric(N_sim)
ranges <- numeric(N_sim)

# Set seed for reproducibility
set.seed(129)

# Simulation loop
for (i in 1:N_sim) {
  # Generate a sample of size n from a normal distribution
  data <- rnorm(n = n, mean = mu, sd = sigma)

  # Store the sample median and sample range
  medians[i] <- median(data)
  ranges[i] <- max(data) - min(data)
}

# Graphical output: Create a 1x2 grid for two plots
par(mfrow = c(1, 2))

# Plot 1: Histogram of the simulated medians
hist(medians, breaks = 30, col = "lightblue", probability = TRUE,
     main = "Distribution of Sample Medians",
     xlab = "Median Value", border = "white")
# Overlay the theoretical normal density curve (Note: this is only an approximation for the median)
curve(dnorm(x, mean = mu, sd = sigma / sqrt(n)), add = TRUE, col = "red", lwd = 2)

# Plot 2: Histogram of the simulated ranges
hist(ranges, breaks = 30, col = "lightgreen", probability = TRUE,
     main = "Distribution of Sample Ranges",
     xlab = "Range Value", border = "white")

# Switch back to a single plotting area for the next plots
par(mfrow = c(1, 1))

# Plot 3: Density plot comparing medians with a normal curve
plot(density(medians), col = "blue", lwd = 2,
     main = "Density Plot of Sample Medians",
     xlab = "Median Value",
     ylim = c(0, dnorm(0, mean=mu, sd=sigma/sqrt(n)) * 1.05)) # Adjust ylim to fit the theoretical curve
# Overlay the theoretical normal density curve
curve(dnorm(x, mean = mu, sd = sigma / sqrt(n)), add = TRUE, col = "red", lwd = 2)

# Plot 4: Boxplot of medians and ranges
boxplot(list(Medians = medians, Ranges = ranges),
        col = c("lightblue", "lightgreen"),
        main = "Boxplot of Sample Medians and Ranges",
        ylab = "Value")
