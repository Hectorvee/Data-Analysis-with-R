# A doctor at a diabetes clinic wants to know how well newly diagnosed insulin-dependent patients manage the
# difficult task of regulating their blood sugar levels. The doctor measured the blood sugar levels (BSL) of n = 121
# patients when they visited the clinic for their first examination after their initial diagnosis. The first question the
# doctor wants to answer is whether the BSL levels are normally distributed, as this will determine if he should use
# parametric or non-parametric statistics tests (we will do more assumption checking in the next practical). The
# data are given in the BSL.csv data file.

bsl_data <- read.csv("BSL.csv")
View(bsl_data)

# The procedure in R to fit a continuous probability distribution, in this case the normal distribution, using the
# Chi-squared goodness-of-fit is as follows:

# 1) If the parameter is not assumed to be equal to a specific value, estimate the parameter (in this case μ and σ)
# using the sample mean and sample standard deviation. The maximum likelihood estimate of μ is just the sample mean and
# the maximum likelihood estimate of σ is the sample standard deviation.
mean_bsl <- mean(bsl_data$BSL)
mean_bsl

sd_bsl <- sd(bsl_data$BSL)
sd_bsl

# 2) Standardise each observed data value to create z-scores.
# z = (x - μ) / σ
z_scores <- (bsl_data$BSL - mean_bsl) / sd_bsl
z_scores

hist(z_scores)
summary(z_scores)

# 3) Group the z-scores into classes, called bins, all of equal class width. There must be sufficient sample size
# in each bin for the test to be valid. For this example, create bins for the majority of the standard normal
# distribution in increments of 0.5, using the cut() function. Because the expected frequencies in the tail
# areas are small, combine cells to conform to the requirement that the expected frequencies must be at least
# # 5. Also, combine the observed frequencies cells at the extremes if these cells have a frequency of zero.

z_breaks <- seq(-2, 2, by = 0.5)
bins <- cut(z_scores, breaks = z_breaks)
observed <- table(bins)
# observed[length(observed) - 1] <- observed[length(observed) - 1] + observed[length(observed)]
# observed <- observed[-length(observed)]
# observed

# 4) For each bin/class interval (a, b), calculate the P(a < Z < b) = P(Z < b) - P(Z < a) using the pnorm() function.
z_exp <- numeric(0) # Create an empty vector to store the expected probabilities
for (i in 1:abs(length(z_breaks)) - 1) {
  z_exp[i] <- pnorm(z_breaks[i + 1]) - pnorm(z_breaks[i])
}

# To ensure that the probabilities all add to 1, we must include the two tail areas.
# Add P(Z < -2) to P(-2 < Z < -1.5), i.e., the first class interval.
# Add P(Z > 2) to P(1.5 < Z < 2), i.e., the last class interval.
z_exp[1] <- z_exp[1] + pnorm(z_breaks[1]) # Add P(Z < -2) to P(-2 < Z < -1.5)
z_exp[8] <- z_exp[8] + pnorm(z_breaks[1]) # Add P(Z > 2) to P(1.5 < Z < 2)

z_exp
sum(z_exp)

# 5) Perform a chi-squared test using the chisq.test() function.
chi_squared_test <- chisq.test(x = observed, p = z_exp)
chi_squared_test

# 6) Check that the minimum expected frequencies >= 5.
str(chi_squared_test)
min(chi_squared_test$expected)

# 7) Calculate the p-value for the test statistic.
length(z_exp)
p_value <- 1 - pchisq(chi_squared_test$statistic, length(z_exp) - 1 - 1 - 1)  # Subtract 1 for the degrees of freedom
p_value

# 8) Interpret the results.
# Since the p-value is 0.01018589, which is less than 0.05, we reject the null hypothesis that the data follow a normal distribution.
# We can conclude that the data do not seem to follow a normal distribution. This means that the doctor should use non-parametric

## Empirical Cumulative Distribution Function (ECDF) plot
# The ECDF plot is a visual representation of the empirical cumulative distribution function of the data.
# The empirical cumulative distribution function (ECDF) is a step function that displays all the observed data values
# (x-axis) of a continuous random variable from lowest to highest against their percentiles (y-axis). The function
# assigns the probability 1/n to each value in the sample and computes the proportion of the sample at or below that
# value.

# Exercise 3
# 1) Plot the ecdf of the standardized BSL data using the ecdf() function.
ecdf_bsl <- ecdf(z_scores)
ecdf_bsl

plot(ecdf_bsl)  # Plot the ECDF of the standardized BSL data

# 2) Add the curve of the standard normal CDF to the plot using the function: curve(pnorm, from = −2, to = 2,add = T)
curve(pnorm, from=-2, to=2, add=T)  # Add the theoretical CDF of the standard normal distribution

# 3) Comment on the results.
# The ECDF plot of the standardized BSL data does not follow the S-shaped curve of the standard normal distribution.
# This indicates that the data are not normally distributed. The ECDF plot provides a visual confirmation of the results
# obtained from the chi-squared goodness-of-fit test.


