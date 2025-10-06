# Define simulation parameters and degrees of freedom
n <- 10        # A sample size, needed for df = n-1
N_sim <- 3000  # Number of simulations

# Set seed for reproducibility
set.seed(123)

# Generate N_sim random deviates from a t-distribution with df = n-1
t_data <- rt(n = N_sim, df = n - 1)

# Generate N_sim random deviates from a standard normal distribution (mean=0, sd=1)
normal_data <- rnorm(n = N_sim)

# Graphical output: Create a 1x2 grid for two plots
par(mfrow = c(1, 2))

# Histogram of the simulated t-distribution data
hist(t_data, breaks = 30, col = "lightblue", probability = TRUE,
     main = paste("t-Distribution (df = ", n - 1, ")"),
     xlab = "Value", border = "white")
# Overlay the theoretical t-distribution density curve
curve(dt(x, df = n - 1), add = TRUE, col = "red", lwd = 2)

# Histogram of the simulated normal distribution data
hist(normal_data, breaks = 30, col = "lightgreen", probability = TRUE,
     main = "Standard Normal Distribution",
     xlab = "Value", border = "white")
# Overlay the theoretical normal density curve
curve(dnorm(x), add = TRUE, col = "blue", lwd = 2)

# Create a density plot comparison
# Reset plotting area to 1x1 for this single plot
par(mfrow = c(1, 1))
plot(density(t_data), col = "red", lwd = 2,
     main = "Density Comparison: t vs. Normal",
     xlab = "Value",
     ylim = c(0, 0.45)) # Adjust ylim to fit both density curves well
lines(density(normal_data), col = "blue", lwd = 2)
legend("topright", legend = c("t-Distribution", "Normal Distribution"),
       col = c("red", "blue"), lty = 1, lwd = 2)

# Q-Q plot comparing the t-distribution data to theoretical t-distribution quantiles
qqplot(qt(ppoints(N_sim), df = n - 1), t_data,
       main = "Q-Q Plot for t-Distribution",
       col = "red",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
abline(a = 0, b = 1, col = "blue", lwd = 2)
