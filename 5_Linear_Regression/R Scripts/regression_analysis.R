data(airquality)
View(airquality)

## Regression Analysis

# Overview
# Regression analysis is a statistical technique that models and estimates the relationship between a dependent variable and one or more independent variables. It is widely used for:
# - Estimating Relationships: Understanding how the dependent variable changes with variations in the independent variables.
# - Predictions: Obtaining point estimates and confidence intervals for predictions.
# - Analyzing Multiple Variables: Using techniques such as linear regression, logistic regression, ridge regression, lasso regression, and polynomial regression.

# Key Concepts
# - Dependent Variable (Y): The output or effect that we are trying to predict or explain.
# - Independent Variable (X): The input or cause that influences the dependent variable.

# Regression Model
# The general form of a regression model is:
# Y = β0 + β1X1 + β2X2 + ... + βkXk + ε
# where:
# - Y is the dependent variable.
# - X1, X2, ..., Xk are the independent variables.
# - β0, β1, β2, ..., βk are the unknown parameters.
# - ε is the error term.

# Estimation of Parameters
# The unknown parameters (β) are estimated using the least squares method, which minimizes the sum of the squared differences between the observed and predicted values.

# Types of Regression
# 1. Linear Regression: Models the relationship between the dependent variable and one or more independent variables using a linear equation.
# 2. Logistic Regression: Used when the dependent variable is categorical, often binary.
# 3. Ridge Regression: A technique for analyzing multiple regression data that suffer from multicollinearity.
# 4. Lasso Regression: Similar to ridge regression but includes a penalty that can shrink some coefficients to zero, effectively selecting a simpler model.
# 5. Polynomial Regression: Models the relationship between the dependent variable and the independent variables as an nth degree polynomial.

# Important Terms
# - Constants: Fixed values in the regression equation.
# - N: Number of independent measurements.
# - k: Number of unknown parameters.

# Applications
# - Predictive Modeling: Forecasting future trends based on historical data.
# - Risk Management: Assessing the impact of various risk factors.
# - Optimization: Finding the best parameters to maximize or minimize a certain outcome.

# Example: Linear Regression
# In this example, we will use the airquality dataset to predict the ozone concentration based on temperature.
data(airquality)
View(airquality)
lm_model <- lm(Ozone ~ Temp, data = airquality)
# formula = dependent_variable ~ independent_variable
summary(lm_model)

# Interpretation
# The regression model shows a statistically significant relationship between temperature and Ozone levels.
# For every 1-degree increase in temperature, Ozone levels are predicted to increase by 2.43 units.
# the model has an R-squared value of 0.487, indicating that 48.7% of the variance in Ozone levels can be explained by temperature.
# However, there is still a significant amount of unexplained variance, as indicated by the residual standard error.

# Plotting the Regression Line
plot(
  airquality$Ozone ~ airquality$Temp, # The
  xlab = "Temperature", # X-axis label
  ylab = "Ozone", # Y-axis label
  pch = 19, # Point character
  col = "blue", # Point color
  main = "Linear Regression"  # Title
)

# a <- coef(lm_model)[1] # Intercept
# b <- coef(lm_model)[2] # Slope
abline(lm_model, col = "red") # Add regression line

# Predictions
new_data <- data.frame(Temp = 80)
predict(lm_model, newdata = new_data)

# Residual Analysis
plot(lm_model, which = 1) # Residuals vs Fitted: Check for linearity
plot(lm_model, which = 2) # Normal Q-Q plot: Check for normality
plot(lm_model, which = 3) # Scale-Location plot: Check for homoscedasticity
plot(lm_model, which = 4) # Residuals vs Leverage: Check for outliers



# Call:
# lm(formula = Ozone ~ Temp, data = airquality)
#
# Residuals:
#     Min      1Q  Median      3Q     Max
# -40.729 -17.409  -0.587  11.306 118.271
#
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)
# (Intercept) -146.9955    18.2872  -8.038 9.37e-13 ***
# Temp           2.4287     0.2331  10.418  < 2e-16 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 23.71 on 114 degrees of freedom (37 observations deleted due to missingness)

# Multiple R-squared:  0.4877,	Adjusted R-squared:  0.4832

# F-statistic: 108.5 on 1 and 114 DF,  p-value: < 2.2e-16

# 48.77% of the variance in Ozone levels can be explained by temperature.




# Assumptions of Linear Regression
# 1) Linearity
# Assumption: The relationship between the predictors and the response variable is linear.
# How to Check: Plot residuals vs. fitted values. If the plot shows random scatter around
# the horizontal line (zero), the linearity assumption holds. If there is curvature, it
# suggests the linear model isn't appropriate.
plot(lm_model, 1) # Residuals vs Fitted

# 2) Homoscedasticity (Equal Variance of Residuals)
# Assumption: The residuals have constant variance (homoscedasticity) across all levels of the predicted values.
# How to Check: Use the residuals vs. predicted values plot again. If the residuals
# "fan out" or have a cone shape (i.e., variance increases or decreases with fitted
# values), this indicates heteroscedasticity.
plot(lm_model, 3) # Scale-Location plot

# 3) Normality of Residuals
# Assumption: The residuals are normally distributed.
# How to Check:
# Plot a histogram of the residuals to see if they follow a bell-shaped curve.
# Use a normal probability plot (Q-Q plot) of the residuals. If residuals fall
# along a straight line in the Q-Q plot, they are approximately normally distributed.
plot(lm_model, 2) # Normal Q-Q plot

# 4) Independence of Residuals
# Assumption: The residuals are independent of each other.
# How to Check:
# Examine the residuals vs. predicted values plot again for any obvious patterns.

# 5) Multicollinearity
# Assumption: The independent variables are not highly correlated with each other.
# How to Check:
# First, examine a correlation matrix of all predictors. If pairs of independent variables have high correlation coefficients, multicollinearity might be an issue.
# Use the variance inflation factor (VIF):
# A VIF close to 1 means no multicollinearity.
# A VIF between 1 and 5 suggests moderate multicollinearity, which might not affect the model too much.
# A VIF greater than 5 indicates strong multicollinearity, meaning the model coefficients and p-values may be unreliable.

# 6) Outliers
# Assumption: Outliers do not unduly influence the model fit.
# How to Check:
# Look for outliers in the residuals vs. predicted plot. Points far from the rest may be outliers.
# You can also use formal tests for detecting influential outliers, though this is typically a more advanced topic.
plot(lm_model, 4) # Residuals vs Leverage


# Example
# The annual data on advertising, promotions, sales expenses and sales
# for a sample of companies are given in the sales.csv dataset.
# All variables are measured in millions of dollars. Fit a MLR
# model to predict sales using the other three variables.

# Regression analysis
sales <- read.csv("../data/sales.csv")
View(sales)


sales_reg <- lm(sales ~ advertising + promotion + expenses, data=sales)
summary(sales_reg)

