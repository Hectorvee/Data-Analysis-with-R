# 2. A researcher collected air quality data, expressed as an air pollution index (api), wind velocity (wind) in
# km/h, temperature (temp) in °F and humidity (humid) in percentage, in a large city for 20 days during
# summer. The data are given in the API.csv dataset.

# load the data
api <- read.csv("../data/API.csv")
View(api)

# a) Create a correlation matrix and discuss all pairwise linear relationships.
cor(api)

# Results
#              api       wind      temp     humid
# api    1.0000000 -0.5746979 0.3404103 0.3080594
# wind  -0.5746979  1.0000000 0.0139061 0.3185819
# temp   0.3404103  0.0139061 1.0000000 0.2412395
# humid  0.3080594  0.3185819 0.2412395 1.0000000

# The correlation matrix shows that the air pollution index (api) is negatively correlated with wind velocity (wind)
# (-0.5746979), and positively correlated with temperature (temp) (0.3404103) and humidity (humid) (0.3080594). Wind
# velocity and humidity are positively correlated (0.3185819), while wind velocity and temperature have a weak positive
# correlation (0.0139061). Temperature and humidity are weakly correlated (0.2412395).


# b) Develop a MLR model to predict the air quality in a large city during the summer months, using wind
# velocity, temperature and percentage humidity.
api_model <- lm(api ~ wind + temp + humid, data = api)
summary(api_model)

# Results:
# Call:
# lm(formula = api ~ wind + temp + humid, data = api)
#
# Residuals:
#     Min      1Q  Median      3Q     Max
# -8.9458 -2.5631  0.5786  2.1673  8.7789
#
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)
# (Intercept)  25.9848    18.0817   1.437  0.16996
# wind         -1.1736     0.2506  -4.683  0.00025 ***
# temp          0.2593     0.1696   1.529  0.14584
# humid         0.5099     0.1694   3.010  0.00831 **
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 4.191 on 16 degrees of freedom
# Multiple R-squared:  0.6499,	Adjusted R-squared:  0.5843
# F-statistic:   9.9 on 3 and 16 DF,  p-value: 0.0006252


# c) Plots the residual, normal and outlier graphs.
par(mfrow = c(2, 2))  # Set the layout to 2x2
par(mar = c(2, 2, 2, 2))  # Set the margin to 2 on all sides
plot(api_model, 1)  # Residuals vs Fitted
plot(api_model, 2)  # Normal Q-Q
plot(api_model, 3)  # Scale-Location
plot(api_model, 4)  # Residuals vs Leverage

# d) Interpret the regression results.
# The regression model is significant (from the ANOVA). The R-squared value is approximately 0.65, indicating
# that the model does not account for all the variability in API using the predictor variables. Wind velocity and
# humidity both have a highly significant impact on API, and the direction of the impact is as we have seen in
# the correlations. Note that the pairwise correlation between API and humidity was fairly low, but when the
# variable is combined with other variables in the regression model, its importance in prediction increases.
# Temperature does not have an impact on API (insignificant predictor). The residuals are not randomly scattered
# around 0, there appears to be a curved pattern in the residuals, which indicates a possible non-linear
# relationship. This could also be a result of the two possible outliers, #2 and #10. The normality of the residuals
# also appears to be affected by the two possible outliers. Cook’s distance only shows that observations #2 is a
# possible outlier. Note that Cook’s distance is only one of many outlier diagnostics we use to identify outliers.

# e) Predict the API value when wind velocity is equal to 10 km/h, temperature is equal to 95°F, and the
# percentage humidity is equal to 76%.
new_data <- data.frame(wind = 10, temp = 95, humid = 76)
predict(api_model, newdata = new_data)

# f) What could you do to improve the results?
# Remove the insignificant variable, remove outliers. However, this is a very small dataset and there is no
# guarantee that, in doing so, the resulting model will be an improvement. It would be better to collect more
# data, and perhaps also other variables as possible predictors of API.







