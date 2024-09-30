# Suppose that we observed the following number of children in n = 100 families:
# Number of children 0 1 2 3 4+
# Frequency 19 26 29 13 13

# Are these data consistent with a Poisson distribution? The raw data are given in the child.csv data file.

# The procedure in R to fit a discrete probability distribution, in this case the Poisson distribution, using the
# Chi-squared goodness-of-fit is as follows:

# 1) If the parameter is not assumed to be equal to a specific value, estimate the parameter (in this case λ) using
# the average of the variable. The maximum likelihood estimate of λ is just the sample mean.
child_data <- read.csv("child.csv")
View(child_data)
number_of_children <- table(child_data$children)
number_of_children

# The variable has values 0 to 5, but low frequency with the value 5. It is better to combine values 4 and 5 into
# 1 category "4+".
child_data_copy <- child_data
child_data_copy$children[child_data_copy$children == 5] <- 4

child_observed <- table(child_data_copy$children)
child_observed

lamda <- mean(child_data$children)
lamda

# 2) Calculate the Poisson probabilities for each of the values of the variable using the dpois() function. Adapt
# this function for the required discrete distribution. Note: for the chi-squared test all probabilities must add
# up to 1, so the probability of the last category must be calculated using the complement rule.
poisson_probabilities <- dpois(c(0, 1, 2, 3), lamda)
poisson_probabilities <- c(poisson_probabilities, 1-sum(poisson_probabilities))
poisson_probabilities
sum(poisson_probabilities)

# 3) Perform a chi-squared test using the chisq.test() function.
chi_squared_test <- chisq.test(x = child_observed, p = poisson_probabilities)
chi_squared_test
View(chi_squared_test)

# 4) Check that the minimum expected frequencies >= 5.
str(chi_squared_test)
min(chi_squared_test$expected)

# 5) Calculate the p-value for the test statistic.
p_value <- 1-pchisq(2.0846, length(poisson_probabilities)-1-1)
p_value

# Calculate the critical value for the chi-squared distribution with 3 degrees of freedom and a significance level of 0.1.
critical_value <- qchisq(0.1, 3)
critical_value

# 6) Interpret the results.
# Since the p-value is greater than 0.1, we fail to reject the null hypothesis that the data follow a Poisson distribution.
# We can conclude that the data seem to follow a Poisson distribution with rate 1.78. Note, we have not proven this
# completely, but there is nothing in the data to suggest otherwise.




