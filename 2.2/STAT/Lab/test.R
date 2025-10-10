mu <- 5; sigma <- 2 ; N_sim <- 1000 ; n<-30
# Set the seed for reproducibility

sample_mean <- numeric(N_sim)
sample_var <- numeric(N_sim)
set.seed(123)

for (i in 1:N_sim) {
    # Generate a random sample of size n from the normal distribution with mean mu and standard deviation sigma
    x <- rnorm(n, mean = mu, sd = sigma)
    # Calculate the sample mean and sample variance
    sample_mean[i] <- mean(x)
    sample_var[i] <- var(x)
}

correlation = cor(sample_mean, sample_var)
par(mfrow=c(2,2))
plot(sample_mean, sample_var, main="Scatterplot of Sample Mean and Sample Variance", xlab="Sample Mean", ylab="Sample Variance")
hist(sample_mean, breaks = 30, col = "blue", main="Histogram of Sample Means", xlab = "Sample Mean", ylab = "Frequency")
curve(dnorm())

hist(sample_var, breaks = 30, col = "blue", main="Histogram of Sample Var", xlab = "Sample Variance", ylab = "Frequency")

