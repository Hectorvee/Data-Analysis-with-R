## Boostrapping
# Load necessary libraries
install.packages("boot")
library(boot)

# Example data
data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# Define the function to calculate the statistic of interest
statistic <- function(data, indices) {
  return(mean(data[indices]))
}

# Perform bootstrapping
set.seed(123) # Set seed for reproducibility
results <- boot(data=data,   # Data
                statistic=statistic,  # Function to calculate the statistic of interest
                R=1000  # Number of bootstrap samples
)

# View the results
results

# ---------- Exercise 9 ----------
# Consider the following sample of heights (measured in centimetres) of n = 22 Grade 6 learners:
# 141.0 156.5 162.0 159.0 157.0 143.5 154.0 158.0 140.0 142.0 150.0
# 148.5 138.5 161.0 153.0 145.0 147.0 158.5 160.5 167.5 155.0 137.0

#1. Create a vector of heights for this data in R.
heights <- c(141.0, 156.5, 162.0, 159.0, 157.0, 143.5, 154.0, 158.0, 140.0, 142.0, 150.0,
             148.5, 138.5, 161.0, 153.0, 145.0, 147.0, 158.5, 160.5, 167.5, 155.0, 137.0)

# 2. Determine the minimum, maximum, median and mean values of height.
min_height <- min(heights)
max_height <- max(heights)
median_height <- median(heights)
mean_height <- mean(heights)

# 3. Plot the histogram of height values and comment on the shape of the distribution in terms of modality and
# symmetry.
hist(heights, main="Histogram of Heights", xlab="Height (cm)", ylab="Frequency")
# Comment: The histogram appears to be bimodal, with two distinct peaks in the distribution.
# The distribution is not symmetric.

# 4. Plot the box-and-whisker plot of the height values and comment on the shape of the distribution in terms
# of symmetry.
boxplot(heights, main="Boxplot of Heights", ylab="Height (cm)")
# Comment: The boxplot shows the presence of outliers on the lower end of the distribution.

# 5. Draw 2 bootstrap samples from the sample of observations, each of size n = 22:
bootstrap_sample1 <- sample(heights, 22, replace=TRUE)
bootstrap_sample2 <- sample(heights, 22, replace=TRUE)

# a) Show which observations from the original sample are included in each of your bootstrap samples
# and comment on what you see
intersect(bootstrap_sample1, heights)
intersect(bootstrap_sample2, heights)
# Comment: The bootstrap samples may contain duplicate values from the original sample, as sampling is done with
# replacement.

# b) For each bootstrap sample, calculate the minimum, maximum, median and mean values of height and
# compare these with the statistics calculated in (2)
min_bootstrap1 <- min(bootstrap_sample1)
max_bootstrap1 <- max(bootstrap_sample1)
median_bootstrap1 <- median(bootstrap_sample1)
mean_bootstrap1 <- mean(bootstrap_sample1)

min_bootstrap2 <- min(bootstrap_sample2)
max_bootstrap2 <- max(bootstrap_sample2)
median_bootstrap2 <- median(bootstrap_sample2)
mean_bootstrap2 <- mean(bootstrap_sample2)

# Compare with original statistics
comparison <- data.frame(
  Original = c(min_height, max_height, median_height, mean_height),
  Bootstrap1 = c(min_bootstrap1, max_bootstrap1, median_bootstrap1, mean_bootstrap1),
  Bootstrap2 = c(min_bootstrap2, max_bootstrap2, median_bootstrap2, mean_bootstrap2)
)
comparison

# Comment: The statistics calculated from the bootstrap samples may vary from the original sample statistics due to the
# random sampling process.

# 6. Draw 100 bootstrap samples from the sample of observations, each of size n = 22:
bootstrap_samples <- matrix(0, nrow=100, ncol=22)

for (i in 1:100) {
  bootstrap_samples[i, ] <- sample(heights, 22, replace=TRUE)
}

bootstrap_samples

# a) Create a matrix with the median and mean values of height for each bootstrap sample
bootstrap_stats <- matrix(0, nrow=100, ncol=2)

for (i in 1:100) {
  bootstrap_stats[i, 1] <- median(bootstrap_samples[i, ])
  bootstrap_stats[i, 2] <- mean(bootstrap_samples[i, ])
}

colnames(bootstrap_stats) <- c("Median", "Mean")

# b) Plot the histogram and box-and-whisker plot of the median height, and of the mean height
par(mfrow=c(2, 2))
hist(bootstrap_stats[, "Median"], main="Histogram of Median Heights", xlab="Median Height (cm)", ylab="Frequency")


# c) Estimate the mean and standard deviation of the distribution of sample medians and the distribution
# of sample means
# d) Which is the least variable (more precise) estimate: median or mean?





























