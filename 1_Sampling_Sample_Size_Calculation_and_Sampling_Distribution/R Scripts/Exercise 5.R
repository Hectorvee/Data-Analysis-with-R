## Confidence interval method: One-sample mean
# A researcher wants to estimate the mean systolic blood pressure of children between the ages 3 and 5 with
# congenital heart disease. He wants the calculated (1 – α)% CI to be within 3 units of the true mean. Assume that
# the population size N is large relative to any appropriate sample size, i.e., there is no need to use the finite
# population correction. Write a loop in R to calculate the sample sizes for the 90%, 95% and 99% confidence
# intervals, using three different assumed population standard deviation values of 10, 15 and 20 and create the
# following contingency table to summarise all the sample sizes.
sigma_list <- c(10, 15, 20)
alpha_list <- c(0.1, 0.05, 0.01)
e_margin_error <- 3

n_list <- matrix(NA, nrow = length(sigma_list), ncol = length(alpha_list))
rownames(n_list) <- c("sigma = 10", "sigma = 15", "sigma = 20")
colnames(n_list) <- c("90% CI", "95% CI", "99% CI")

# for-loop
for (i in 1:abs(length(sigma_list))) {
  for (j in 1:abs(length(alpha_list))) {
    n_list[i, j] <- (qnorm(1-alpha_list[j]/2)*sigma_list[i] / e_margin_error)^2
  }
}

ceiling(n_list)

# Results
#              90% CI    95% CI    99% CI
# sigma = 10 18.24860  30.06159  60.13216
# sigma = 15 41.05936  67.63859 135.29736
# sigma = 20 72.99442 120.24638 240.52864

# Intepretation
# The sample size required to estimate the mean systolic blood pressure of children between the ages 3 and 5 with
# congenital heart disease with a 90% confidence interval is 18, 41 and 73 for population standard deviation of 10,
# 15 and 20 respectively.

# The sample size required to estimate the mean systolic blood pressure of children between the
# ages 3 and 5 with congenital heart disease with a 95% confidence interval is 30, 68 and 120 for population standard
# deviation of 10, 15 and 20 respectively.

# The sample size required to estimate the mean systolic blood pressure of
# children between the ages 3 and 5 with congenital heart disease with a 99% confidence interval is 60, 135 and 240 for
# population standard deviation of 10, 15 and 20 respectively.





