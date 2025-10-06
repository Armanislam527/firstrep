# Define simulation parameters
K <- 5        # Degrees of freedom (df) for the chi-squared distribution
N_sim <- 1000 # Number of simulations (random variates to generate)

# Set seed for reproducibility
set.seed(123)

# Generate N_sim random deviates from a chi-squared distribution with K degrees of freedom
chi2_data <- rchisq(n = N_sim, df = K)

# Calculate the mean and variance of the simulated data
mean_chi2 <- mean(chi2_data)
var_chi2 <- var(chi2_data)

# Print the calculated mean and variance
print(paste("Sample mean:", mean_chi2))
print(paste("Sample variance:", var_chi2))
# For a chi-squared distribution, the theoretical mean is 'df' and variance is '2*df'.
# The printed values should be close to K and 2*K, respectively.
print(paste("Theoretical mean:", K))
print(paste("Theoretical variance:", 2 * K))

# Graphical output: Create a 1x3 grid for three plots
par(mfrow = c(1, 3))

# Histogram of the simulated chi-squared data
hist(chi2_data, breaks = 30, col = "lightblue", probability = TRUE,
     main = "Histogram of Chi-squared Data",
     xlab = "Value", border = "white")
# Overlay the theoretical chi-squared density curve
curve(dchisq(x, df = K), add = TRUE, col = "red", lwd = 2)

# Q-Q plot for the chi-squared data against theoretical chi-squared quantiles
qqplot(qchisq(ppoints(N_sim), df = K), chi2_data,
       main = "Q-Q Plot for Chi-squared Data",
       col = "blue",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
# Add a reference line (y=x) to check for agreement with the theoretical distribution
abline(a = 0, b = 1, col = "red", lwd = 2)

# Alternative, simpler Q-Q plot using qqplot() with the distribution parameter
# qqplot(chi2_data, distribution = function(p) qchisq(p, df = K),
#        main = "Q-Q Plot for Chi-squared Data",
#        col = "blue",
#        xlab = "Theoretical Quantiles",
#        ylab = "Sample Quantiles")
# abline(a = 0, b = 1, col = "red", lwd = 2)
