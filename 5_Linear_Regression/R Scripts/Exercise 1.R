# 1. The mydata.csv datafile consists of one dependent variable and three independent variables, all numerical.

# load the data
mydata <- read.csv("../data/mydata.csv", header = TRUE)
mydata <- mydata[, -which(names(mydata) == "ID")]
View(mydata)

# a) Create a correlation matrix and discuss all pairwise linear relationships.
cor(mydata)

# Results
#            Y        X1        X2        X3
# Y  1.0000000 0.8501181 0.7578113 0.2460776
# X1 0.8501181 1.0000000 0.3109788 0.1590640
# X2 0.7578113 0.3109788 1.0000000 0.2729357
# X3 0.2460776 0.1590640 0.2729357 1.0000000

# The correlation matrix shows that Y is highly correlated with X1 (0.8501181) and X2 (0.7578113), while X1 and X2 are
# moderately correlated (0.3109788). X3 has a weak correlation with Y (0.2460776), X1 (0.1590640), and X2 (0.2729357).

# b) Fit a multiple linear regression model to predict Y using the three X variables.
lm_model <- lm(Y ~ X1 + X2 + X3, data = mydata)
summary(lm_model)

# Results
# Call:
# lm(formula = Y ~ X1 + X2 + X3, data = mydata)
#
# Residuals:
#      Min       1Q   Median       3Q      Max
# -1.29136 -0.44040 -0.06919  0.45908  1.49916
#
# Coefficients:
#               Estimate Std. Error t value Pr(>|t|)
# (Intercept) -32.583290   0.761697 -42.777   <2e-16 ***
# X1            0.967159   0.010819  89.393   <2e-16 ***
# X2            0.620280   0.008831  70.236   <2e-16 ***
# X3           -0.089748   0.055364  -1.621    0.107
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 0.6111 on 146 degrees of freedom
# Multiple R-squared:  0.9924,	Adjusted R-squared:  0.9922
# F-statistic:  6348 on 3 and 146 DF,  p-value: < 2.2e-16

# c) Plots the residual, normal and outlier graphs.
par(mfrow = c(2, 2))  # Set the layout to 2x2
par(mar = c(2, 2, 2, 2))  # Set the margin to 2 on all sides
plot(lm_model, 1)
plot(lm_model, 2)
plot(lm_model, 3)
plot(lm_model, 4)

# d) Interpret the regression results.
# The multiple linear regression model predicts Y based on the three X variables. The model is significant (p < 0.05)
# and explains 99.24% of the variance in Y. X1 has a positive effect on Y, with a coefficient of 0.967159, while X2 has
# a positive effect on Y, with a coefficient of 0.620280. X3 has a weak effect on Y, with a coefficient of -0.089748.
# The residual standard error is 0.6111, indicating the average difference between the observed and predicted Y values.
# The model can be used to predict Y based on the values of X1, X2, and X3.

# e) What could you do to improve the results?
# We could remove variable X3 and run the analysis again to see if it improves the model fit. We could also
# remove observation #29 (possible outlier) and rerun the model. However, it is a very good model and could be
# used as it is for prediction purposes.








