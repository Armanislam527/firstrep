# Analyze three-way contingency tables using log-linear models.
# Create a three-way contingency table
data <- array(c(10, 5, 2, 8, 3, 6, 4, 7), dim = c(2, 2, 2))
dimnames(data) <- list(Gender = c("Male", "Female"), 
                       Treatment = c("Yes", "No"), 
                       Outcome = c("Success", "Failure"))

# Fit a log-linear model
log_linear_model <- loglin(data, margin = list(1, 2, 3), fit = TRUE)

# Output
print("Three-Way Contingency Table:")
print(data)
print("Log-Linear Model Output:")
print(log_linear_model)

# Graphical Output
par(mfrow = c(1, 2))

# Convert to 2D matrix for heatmap
heatmap_matrix <- apply(data, c(1, 2), sum)  # Summing over Outcome
heatmap(heatmap_matrix, main = "Heatmap of Gender vs Treatment", col = heat.colors(100))

# Convert data into vectors for interaction plot
Gender <- rep(c("Male", "Female"), times = 4)
Treatment <- rep(c("Yes", "No"), each = 2, times = 2)
Outcome <- rep(c("Success", "Failure"), each = 4)
Counts <- as.vector(data)

# Create an interaction plot
interaction.plot(Treatment, Gender, Counts, 
                 main = "Interaction Plot: Treatment & Gender", 
                 xlab = "Treatment", ylab = "Counts", col = c("red", "blue"), lwd = 2)
