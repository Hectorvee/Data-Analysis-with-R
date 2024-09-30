# 1. Introduction
# In statistics, parametric tests are tests that make assumptions about the underlying distribution of data. The most
# common parametric assumption is that data are approximately normally distributed. If the parametric assumptions
# are violated, it may change the conclusion of the research and the interpretation of the results. The four main
# assumptions for a parametric test to yield valid results are normality, equality of variance, independence and no
# outliers.


# 2. Normality
# Most of the parametric tests require that the assumption of normality be met. Normality means that the distribution
# of the test is normally distributed (or bell-shaped). The assumption of normality can be assessed visually or
# numerically.

# 2.1 Visual methods

# Histogram
# The simplest graph to visually assess if the data are normally distributed is the histogram. This is a very informal
# method and should be used together with formal tests.

# Cumulative distribution
# A comparison of the empirical cumulative distribution function (ECDF) with the theoretical cumulative
# distribution function (CDF) is a useful visual representation. If the ECDF is S-shaped, it indicates normality.
# However, it should also be supported with formal tests. This plot was dealt with in Practical 2.

# Probability plots
# In probability plots, the data density distribution is transformed into a linear plot. The Q-Q plot and the P-P plot
# are both probability plots. A P-P plot compares the ECDF of a dataset with a specified theoretical CDF, whereas
# a Q-Q plot compares the quantiles of a data distribution with the quantiles of a standardized theoretical distribution
# from a specified family of distributions. For the most part, the normal P-P plot is better at finding deviations from
# normality in the centre of the distribution, and the normal Q-Q plot is better at finding deviations in the tails.
# Q-Q plots tend to be preferred in research situations as data analysts are typically more concerned about the tails
# of a distribution, which will have more effect on inference. Both Q-Q and P-P plots can be used for distributions
# other than normal. The qqnorm() function for Q-Q plots is available in R base. The qqline() function adds a line
# to a theoretical (default normal) Q-Q plot which passes through the first and third quartiles. The P-P plot function
# is not available in R base.

# Q-Q plot example
# Lets simulate some data from two different distributions and compare the Q-Q plots.
set.seed(123)
# Simulate data from a normal distribution
normal_data <- rnorm(200, mean = 0, sd = 1) # Mean = 0, SD = 1, n = 200, normal distribution

# Simulate data from a uniform distribution
uniform_data <- runif(200, min = -1, max = 1) # Min = -1, Max = 1, n = 200, uniform distribution

# Create Q-Q plots
par(mfrow = c(1, 2))  # Set up a 1x2 grid of plots for side-by-side comparison of Q-Q plots
qqnorm(normal_data, main = "Normal Q-Q Plot")  # Q-Q plot for normal data
qqline(normal_data)  # Add a line to the Q-Q plot
qqnorm(uniform_data, main = "Uniform Q-Q Plot")  # Q-Q plot for uniform data
qqline(uniform_data)  # Add a line to the Q-Q plot


# 2.2 Numerical methods

# Skewness and kurtosis
# To test the assumption of normality, skewness should be within the range ±2 and kurtosis values should be within
# the range of ±7. In R, the skewness() and kurtosis() functions are available in the moments library, not in base R.
# install and load the moments package
install.packages("moments")
library(moments)

# sample data
data <- rnorm(100)

# calculate skewness and kurtosis
skewness_value <- skewness(data)
kurtosis_value <- kurtosis(data)
print(paste("Skewness: ", skewness_value))
print(paste("Kurtosis: ", kurtosis_value))
# Since the skewness and kurtosis values are within the acceptable range, we can conclude that the data are normally distributed.

# Kolmogorov-Smirnov test
# The Kolmogorov-Smirnov (K-S) test is used to compare two distributions to determine if they come from the
# same underlying distribution (null hypothesis). The K-S test statistic (D) is based on the maximum distance
# between the ECDF of a sample and the CDF of a specific reference distribution, or between the ECDF of one
# sample and the ECDF of another sample.
# The first two arguments of the ks.test() function are “x” and “y”, where “x” is a numeric vector and “y” is either
# a numeric vector or a character string identifying the specific CDF, such as “pnorm”. If both x and y are numeric
# vectors, a two-sample K-S test is performed. If y denotes a specific distribution, a one-sample K-S test is
# performed. In this case we must also specify the parameters of the distribution. The K-S test is not the best test
# when estimating the parameters from the data as this may lead to ties in the data, which may result in a
# conservative p-value. Although the K-S test can still be used in such cases, an alternative is the Anderson-Darling
# test for normality which does not require specifying the mean and standard deviation. This test is not available in
# base R.

# Example 1
# Let's simulate some data from a normal distribution and test the normality assumption using the K-S test.
x <- rnorm(50)
y <- runif(30)

# Test the following hypothesis
# H0: x and y come from the same distribution vs. H1: x and y do not come from the same distribution
ks.test(x, y)
# The p-value is less than 0.01, whic means we reject the null hypothesis at 1% of significance level.
# Very strong evidence that x and y do not come from the same distribution.

# Example 2
# Let's simulate some data from a normal distribution and test the normality assumption using the K-S test.
x <- rnorm(50, mean=100, sd=12)

# Test the following hypothesis
# H0: x follows a normal distribution with a mean of 100 and standard deviation of 12
# H1: x does not follow a normal distribution with a mean of 100 and standard deviation of 12
ks.test(x, "pnorm", mean=100, sd=12)
# The p-value is greater than 1%. We fail to reject the null hypothesis at 1% of significance level.
# Weak/no evidence that x does not follow a normal distribution with a mean of 100 and standard deviation of 12.

# Shapiro-Wilk’s W test
# Shapiro-Wilk’s method is widely recommended for testing normality, and it provides better power than K-S. It is
# based on the correlation between the data and the corresponding normal scores. It is an easy-to-use statistical tool
# that can help us find an answer to the normality check we need, but it has one flaw in that it does not work well
# with large data sets. In such cases alternative tests such as K-S can be used.
# The shapiro.test() function is used to perform the Shapiro-Wilk test of normality for one variable (univariate). It
# has only one argument, namely the data vector.

# Example 1
# Let's simulate some data from a normal distribution and test the normality assumption using the Shapiro-Wilk test.
x <- rnorm(100, mean=5, sd=3)

# Test the following hypothesis
# H0: x follows a normal distribution vs. H1: x does not follow a normal distribution
shapiro.test(x)
# The p-value is greater than 1%. We fail to reject the null hypothesis at 1% of significance level.
# Weak/no evidence that x does not follow a normal distribution.

# Example 2
# Let's simulate some data from a uniform distribution and test the normality assumption using the Shapiro-Wilk test.
x <- runif(100, min=2, max=4)

# Test the following hypothesis
# H0: x follows a normal distribution vs. H1: x does not follow a normal distribution
shapiro.test(x)
# The p-value is less than 0.01. We reject the null hypothesis at 1% of significance level.


# 3. Equal Variance
# Equality of variance, also referred to as homogeneity of variance or homoscedasticity, is an assumption
# underlying the independent samples t-test and ANOVA in which the population variances of two or more
# independent samples are considered equal. There are a number of different methods to assess the equality of
# variances. All methods test the following hypothesis:
# H0: the variances are equal vs. H1: the variances are not equal

# F-test
# The F-test is used to compare variances of two samples selected from normal populations. The test statistic is
# calculated as the ratio of the two variances. If the ratio deviates more from 1, there is stronger evidence of unequal
# variances. A major assumption of the F-test is that the data should be normally distributed. The var.test() function
# in R is used for the F-test.

# Bartlett’s test
# Bartlett’s test is used to compare variances of two or more groups. It is used for normally distributed data. The
# bartlett.test() function in R is used for the Bartlett’s test.

# Levene’s test
# Levene’s test for equality of variance is an alternative to Bartlett’s test, especially if the data are not normally
# distributed. The leveneTest() function is not available in R base.

# Fligner-Killeen’s test
# The Fligner-Killeen test is the most robust test for equality of variance if the assumption of normality is not met,
# or if there are outliers in the data, as it is a non-parametric test based on ranks. The fligner.test() function in R is
# used for the Fligner-Killeen test.

# Tests for equality of variance example
# Let’s simulate data for two independent groups with a) equal variance and b) unequal variance
data1_group1 <- rnorm(100, mean=100, sd=10)  # Create a data frame with 100 observations from a normal distribution with mean 100 and standard deviation 10
data1_group2 <- rnorm(100, mean=100, sd=10)  # Create a data frame with 100 observations from a normal distribution with mean 100 and standard deviation 10

data2_group1 <- rnorm(100, mean=100, sd=10)  # Create a data frame with 100 observations from a normal distribution with mean 100 and standard deviation 10
data2_group2 <- rnorm(100, mean=100, sd=20)  # Create a data frame with 100 observations from a normal distribution with mean 100 and standard deviation 20

# F-test
var.test(data1_group1, data1_group2)
# The p-value is greater than 0.05. We fail to reject the null hypothesis at 5% of significance level.

var.test(data2_group1, data2_group2)
# The p-value is less than 0.05. We reject the null hypothesis at 5% of significance level.

# Bartlett’s test
bartlett.test(list(data1_group1, data1_group2))
# The p-value is greater than 0.05. We fail to reject the null hypothesis at 5% of significance level.

bartlett.test(list(data2_group1, data2_group2))
# The p-value is less than 0.05. We reject the null hypothesis at 5% of significance level.

# Fligner-Killeen’s test
fligner.test(list(data1_group1, data1_group2))
# The p-value is greater than 0.05. We fail to reject the null hypothesis at 5% of significance level.

fligner.test(list(data2_group1, data2_group2))
# The p-value is less than 0.05. We reject the null hypothesis at 5% of significance level.



