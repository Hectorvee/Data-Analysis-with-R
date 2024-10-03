# Comparing Two Simple Linear Regression Lines
# MLR has so far been used for the case where all the variables in the equation are continuous. However, the MLR
# model can include categorical predictor variables. In such cases, the model essentially develops a regression
# model for each of the levels of the categorical variable and allows us to compare the lines. We will restrict our
# analysis to a single numerical dependent variable, one numerical independent variable, and one binary
# independent variable, with values 0 and 1. The result is two simple linear regression lines, one for each level of
# the binary independent variable. We can then compare the slopes and intercepts of the two lines to see if the
# relationships are different for the two groups.
#
# Consider a dataset consisting of a dependent variable Y, a numerical independent variable X and a binary
# independent variable IND. We will model the following MLR equation:
# Y = β0 + β1IND + β2X + β3(IND * X) + ε
#
# The estimated model is therefore:
# Y_hat = b0 + b1IND + b2X + b3(IND * X)
#
# If IND = 0, this equation reduces to Y = β0 + β2X + ε, estimated Y_hat = b0 + b2X.
# If IND = 1, this equation reduces to Y = (β0 + β1) + (β2 + β3)X + ε, estimated Y_hat = (b0 + b1) + (b2 + b3)X.
# To compare the two lines, we test whether the slopes and intercepts are different from one another by looking at
# the p-values of the parameter estimates, testing at the α% level of significance.
# • If β1 = 0 (p-value > α) → intercepts are equal, i.e., the two lines cut the y-axis at the same value.
# • If β1 not= 0 (p-value < α) → intercepts are not equal, i.e., the two lines cut the y-axis at different values.
# • If β3 = 0 (p-value > α) → slopes are equal, i.e., the two lines are parallel.
# • If β3 not= 0 (p-value < α) → slopes are not equal, i.e., the two lines are not parallel.
#
# In R, we can either define the binary variable as a factor, or we can create the product between the X variable and
# the binary indicator variable, and define the model above with three independent variables in the lm() function.

# Example: Comparing Two Simple Linear Regression Lines
# An engineer wants to test if the relationship between the effective life of a tool (Y) and its lathe speed (X) is the
# same or different for two tool types (Type A coded as 0 and Type B coded as 1). The R code is as follows:

# Load the data
tool_data <- read.csv("5_Linear_Regression/tools.csv")
View(tool_data)

# Create a new variable X times indicator, and attach it to the dataset under a new name
type_x <- tool_data$x*tool_data$type
tool_data <- cbind(tool_data, type_x)
View(tool_data)

# Run the linear regression model
tool_model <- lm(y ~ type + x + type_x, data = tool_data)
summary(tool_model)

# Results
# Call:
# lm(formula = y ~ type + x + type_x, data = tool_data)
#
# Residuals:
#     Min      1Q  Median      3Q     Max
# -5.1778 -1.4018  0.4841  1.8524  4.9075
#
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)
# (Intercept) 32.785331   4.527527   7.241 1.97e-06 *** H_o: intercept is 0, H_a: intercept is not 0 (The intercept is 32.785331 and the p-value is 1.97e-06 which is less than 0.05, so the intercept is significant.)
# type        22.890349   6.614200   3.461  0.00322 **  H_o: type does not have a significant effect on y, H_a: type has a significant effect on y (The coefficient for type is 22.890349 and the p-value is 0.00322 which is less than 0.05, so type has a significant effect on y.)
# x           -0.020982   0.005935  -3.535  0.00275 **  H_o: x does not have a significant effect on y, H_a: x has a significant effect on y (The coefficient for x is -0.020982 and the p-value is 0.00275 which is less than 0.05, so x has a significant effect on y.)
# type_x      -0.010652   0.008640  -1.233  0.23542     H_o: type_x does not have a significant effect on y, H_a: type_x has a significant effect on y (The coefficient for type_x is -0.010652 and the p-value is 0.23542 which is greater than 0.05, so type_x does not have a significant effect on y.)
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 2.9 on 16 degrees of freedom
# Multiple R-squared:  0.9123,	Adjusted R-squared:  0.8959
# F-statistic: 55.51 on 3 and 16 DF,  p-value: 1.118e-08

# For tool type A (type = 0): Y = b0 - b2X
# For tool type B (type = 1): Y = (b0 + b1) + (b2 + b3)X
# • Since b1 is significantly different from 0, the two intercepts of the two lines are different.
# • Since b3 is not significantly different from 0, the two slopes of the two lines are not different.
# • Therefore, the relationship between the tool life and lathe speed is the same, but on average the tool life
# of one of the tools is different from the tool life of the other tool.










