# The lm() function is used to fit linear regression models in R. The function has many arguments, but for the
# purpose of this module we will only use the formula and data arguments. For a multiple linear regression model
# with three independent variables, the formula argument defines the model as Y ~ X1 + X2 + X3 (this equation is
# adjusted for any number of independent variables). The data argument identifies the dataset. There are four plots
# as part of the regression output that we will evaluate this year, namely the residuals vs. fitted, normal Q-Q, scale
# location, and Cook’s distance.

# Example: Sales Prediction
# The annual data on advertising, promotions, sales expenses and sales for a sample of companies are given in the
# sales.csv dataset. All variables are measured in millions of dollars. Fit a MLR model to predict sales using the
# other three variables.

# Load the dataset
sales <- read.csv("../data/sales.csv")
View(sales)

# Regression Analysis
sales_model <- lm(sales ~ advertising + promotion + expenses, data = sales)
summary(sales_model)

# Results
# Call:
# lm(formula = sales ~ advertising + promotion + expenses, data = sales)
#
# Residuals:
#      Min       1Q   Median       3Q      Max
# -2.08963 -0.85274  0.04115  0.57856  2.57964
#
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)
# (Intercept)   5.9141     1.8445   3.206  0.00489 ** # (H_o: intercept is 0, H_a: intercept is not 0) The intercept is 5.9141 and the p-value is 0.00489 which is less than 0.05, so the intercept is significant.
# advertising   1.1127     0.6954   1.600  0.12701    # (H_o: advertising does not have a significant effect on sales, H_a: advertising has a significant effect on sales) The coefficient for advertising is 1.1127 and the p-value is 0.12701 which is greater than 0.05, so advertising does not have a significant effect on sales.
# promotion     4.5865     0.6455   7.106 1.27e-06 *** # (H_o: promotion does not have a significant effect on sales, H_a: promotion has a significant effect on sales) The coefficient for promotion is 4.5865 and the p-value is 1.27e-06 which is less than 0.05, so promotion has a significant effect on sales.
# expenses     22.5791     2.0326  11.108 1.73e-09 *** # (H_o: expenses does not have a significant effect on sales, H_a: expenses has a significant effect on sales) The coefficient for expenses is 22.5791 and the p-value is 1.73e-09 which is less than 0.05, so expenses has a significant effect on sales.
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 1.292 on 18 degrees of freedom (The residual standard error is 1.292 and the degrees of freedom is 18.)
# Multiple R-squared:  0.9104,	Adjusted R-squared:  0.8954   (The multiple R-squared value is 0.9104 and the adjusted R-squared value is 0.8954. This indicates that the model explains 91.04% of the variance in sales.)
# F-statistic: 60.93 on 3 and 18 DF,  p-value: 1.264e-09  (The F-statistic is 60.93 with 3 and 18 degrees of freedom, and the p-value is 1.264e-09 which is less than 0.05, so the model is significant.)

# Interpretation
# Based on the F-statistic, the model is significant (p < 0.05) and explains 91.04% of the variance in sales.
# The coefficients for promotion and expenses are significant (p < 0.05), while the coefficient for advertising
# is not significant (p > 0.05). This suggests that promotion and expenses have a significant effect on sales,
# while advertising does not. The residual standard error is 1.292, indicating the average difference between
# the observed and predicted sales values. The model can be used to predict sales based on the values of promotion
# and expenses.

# Check Assumptions

# Assumption 1: Multicollinearity
# Multicollinearity occurs when two or more independent variables are highly correlated, leading to unstable estimates
# of the coefficients. The variance inflation factor (VIF) is used to detect multicollinearity, with values greater
# than 10 indicating a problem.

cor(sales)

# Results
#                  sales advertising   promotion    expenses
# sales        1.0000000  -0.1402891  0.54185188  0.80956373
# advertising -0.1402891   1.0000000 -0.34021309 -0.10058307
# promotion    0.5418519  -0.3402131  1.00000000  0.06258872
# expenses     0.8095637  -0.1005831  0.06258872  1.00000000

# The three independent variables are not highly correlated, and the VIF values are relatively low. Therefore, there
# is no multicollinearity in the data.

# Assumption 2: Residual plot (residuals vs. predicted)
plot(sales_model, which = 1)  # Residuals vs. Fitted

# Non-Linearity: The residuals should be randomly distributed around zero, with no discernible pattern. In this case,
# there appears to be a slight curvature in the residuals, indicating a potential non-linear relationship between the variables.
# Heteroscedasticity: The residuals should have constant variance across the range of predicted values. In this case,
# the residuals appear to have rondomly distributed variance.

# Assumption 3: Normality plot (normal Q-Q)
plot(sales_model, which = 2)  # Normal Q-Q

# The Q-Q plot appears to show approximate normality, although observation #13 and #22 seem a little off, and
# could be outliers.

# Assumption 4: Homoscedasticity plot (scale-location)
plot(sales_model, which = 3)  # Scale-Location

# The scale-location plot shows that the residuals are randomly distributed, indicating homoscedasticity.
# From the graph, the residuals appear somewhat randomly spread but is still affected by the potential
# outliers (#13, #16, #22).

# Assumption 5: Outliers (residuals vs. leverage)
plot(sales_model, which = 4)  # Residuals vs. Leverage

# The residuals vs. leverage plot shows that there are potential outliers in the data, specifically observations
# #13, #16, and #22. These outliers may be influencing the model results and should be investigated further.
# The plot shows that observation 13, 16 and 22 are outliers. We could remove outliers, remove insignificant
# variables, or transform variables to try to improve the model. However, this is a very small dataset (n = 22) and
# we do not see much improvement when we do any of the above. For regression analysis, we use a rule of thumb
# of 10 observations for each independent variable. More data is better.

# Conclusion
# The multiple linear regression model predicts sales based on the variables of advertising, promotion, and expenses.
# The model is significant and explains 91.04% of the variance in sales. Promotion and expenses have a significant
# effect on sales, while advertising does not. The model assumptions have been evaluated, and there are potential
# issues with non-linearity, outliers, and multicollinearity that should be addressed. Further analysis and model
# refinement may be needed to improve the predictive accuracy of the model.


# Example: Marks Prediction
# Import the marks.csv file, consisting of the marks (in percentage) of 50 students for the two semester tests and
# the exam. Check the multicollinearity in the data using the correlation matrix and the VIF value, which is 9.795
# for each of the two test marks.

# Load the dataset
marks <- read.csv("../data/marks.csv")
View(marks)

# Correlation matrix
cor(marks)

# Results
# > cor(marks)
#           Test1     Test2      Exam
# Test1 1.0000000 0.9475803 0.7593029
# Test2 0.9475803 1.0000000 0.5872121
# Exam  0.7593029 0.5872121 1.0000000

# The correlation matrix shows that Test1 and Test2 are highly correlated (0.9475803), while Test1 and Exam (0.7593029)
# and Test2 and Exam (0.5872121) are moderately correlated. The VIF value for each of the two test marks is 9.795,
# indicating multicollinearity in the data.

# Fit a multiple linear regression model to predict the exam marks based on the two test marks.

# Regression Analysis
marks_model <- lm(Exam ~ Test1 + Test2, data = marks)
summary(marks_model)

# Results
# Call:
#   lm(formula = Exam ~ Test1 + Test2, data = marks)
#
# Residuals:
#   Min       1Q   Median       3Q      Max
# -0.93157 -0.29805  0.00966  0.24918  0.98865
#
# Coefficients:
#               Estimate Std. Error t value Pr(>|t|)
# (Intercept) 55.87020    1.11593  50.066  < 2e-16 ***
# Test1        0.39673    0.04576   8.670 2.59e-11 ***
# Test2       -0.27323    0.04833  -5.654 8.96e-07 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 0.4769 on 47 degrees of freedom
# Multiple R-squared:  0.748,	Adjusted R-squared:  0.7372
# F-statistic: 69.74 on 2 and 47 DF,  p-value: 8.603e-15

# Interpretation
# The multiple linear regression model predicts exam marks based on the two test marks. The model is significant
# (p < 0.05) and explains 74.8% of the variance in exam marks. Test1 has a positive effect on exam marks, with a
# coefficient of 0.39673, while Test2 has a negative effect on exam marks, with a coefficient of -0.27323. The
# residual standard error is 0.4769, indicating the average difference between the observed and predicted exam marks.
# The model can be used to predict exam marks based on the values of Test1 and Test2.





