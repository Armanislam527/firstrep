# Define simulation parameters and degrees of freedom
df1 <- 5       # Numerator degrees of freedom
df2 <- 10      # Denominator degrees of freedom
N_sim <- 1000  # Number of simulations

# Set seed for reproducibility
set.seed(123)

# Generate two independent sets of chi-squared random variates
chi2_1 <- rchisq(n = N_sim, df = df1)
chi2_2 <- rchisq(n = N_sim, df = df2)

# Calculate the F-distributed data as the ratio of scaled chi-squared variates
f_data <- (chi2_1 / df1) / (chi2_2 / df2)

# Set up the plotting area to a 2x2 grid
par(mfrow = c(2, 2))

# Plot 1: Histogram of simulated F-data with theoretical density curve
hist(f_data, breaks = 30, col = "lightblue", probability = TRUE,
     main = paste("Histogram of F-Distribution (df1=", df1, ", df2=", df2, ")"),
     xlab = "Value", border = "white")
curve(df(x, df1 = df1, df2 = df2), add = TRUE, col = "red", lwd = 2)

# Plot 2: Density plot of simulated F-data with theoretical density curve
plot(density(f_data), col = "blue", lwd = 2,
     main = "Density Plot of F-Distribution",
     xlab = "Value")
curve(df(x, df1 = df1, df2 = df2), add = TRUE, col = "red", lwd = 2)
legend("topright", legend = c("Simulated Density", "Theoretical Density"),
       col = c("blue", "red"), lty = 1, lwd = 2)

# Plot 3: Q-Q plot for F-distribution
qqplot(qf(ppoints(N_sim), df1 = df1, df2 = df2), f_data,
       main = "Q-Q Plot for F-Distribution", col = "blue",
       xlab = "Theoretical Quantiles", ylab = "Sample Quantiles")
abline(a = 0, b = 1, col = "red", lwd = 2)

# Plot 4: Boxplot of simulated F-data
boxplot(f_data, col = "lightgreen",
        main = "Boxplot of F-Distributed Data", ylab = "Value")
