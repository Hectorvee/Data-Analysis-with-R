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
lm_model <- lm(Ozone ~ Temp, data = airquality)
summary(lm_model)$sigma

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
plot(lm_model, which = 1) # Residuals vs Fitted
plot(lm_model, which = 2) # Normal Q-Q plot
plot(lm_model, which = 3) # Scale-Location plot
plot(lm_model, which = 4) # Residuals vs Leverage




