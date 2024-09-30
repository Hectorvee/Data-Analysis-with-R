## Chi-Squared Goodness-of-Fit Test
# Scenario: Suppose a die manufacturer claims that their die is fair,
# meaning each of the six faces has an equal probability of landing
# face up. To test this claim, you roll the die 60 times and record
# the observed frequencies of each face.

# Observed frequencies
observed <- c(8, 10, 12, 9, 11, 10)

# Expected frequencies
expected <- rep(10, 6)

# Chi-squared goodness-of-fit test
chiq_test <- chisq.test(x=observed, p=rep(1/6, 6))

# Print the test results
print(chiq_test)

# Output:
# Chi-squared test for given probabilities
#
# data:  observed
# X-squared = 1, df = 5, p-value = 0.9626

# Conclusion: Since the p-value is greater than 0.05, we fail to reject the null hypothesis that the die is fair.



