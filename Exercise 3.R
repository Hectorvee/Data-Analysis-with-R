# 3. A nutrition expert wanted to investigate the impact of protein content in diet on the relationship between
# age and height of children. She collected the ages (in years) and height (in centimetres) for a sample of
# children with protein-rich (indicator DIET = 0) and protein-poor (indicator DIET = 1) diets, respectively.
# Create the interaction term for diet and age (diet × age). The data are given in the diet.csv file.

# Load the data
diet <- read.csv("5_Linear_Regression/data/diet.csv")
View(diet)

# Create the interaction term
diet$age_diet <- diet$age * diet$diet

# a) Fit a MLR model where Y = height, and compare the slope and intercept of the regression line for the
# protein-rich diet with that of the protein-poor diet.

diet_model <- lm(height ~ diet + age + age_diet, data = diet)
summary(diet_model)

# Results
# Call:
# lm(formula = height ~ age + diet + age_diet, data = diet)
#
# Residuals:
# Call:
# lm(formula = height ~ diet + age + age_diet, data = diet)
#
# Residuals:
#     Min      1Q  Median      3Q     Max
# -4.3506 -1.3298  0.2637  1.4173  3.4888
#
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)
# (Intercept)  50.3237     1.3605  36.988  < 2e-16 ***
# diet          0.9015     1.8619   0.484    0.633
# age          16.0090     0.7319  21.873  < 2e-16 ***
# age_diet     -7.3229     0.9965  -7.349 1.78e-07 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 2.279 on 23 degrees of freedom
# Multiple R-squared:  0.9722,	Adjusted R-squared:  0.9686
# F-statistic:   268 on 3 and 23 DF,  p-value: < 2.2e-16


# b) Comment on the similarities and differences.

# Compare the intercepts of the regression lines for the two different diets
# To compare the intercepts, we look at whether the parameter estimate (b1) of the indicator variable (diet) is
# significantly different from zero or not. Since b1 is not significant, the intercepts are approximately equal.
# #Compare the slopes of the regression lines for the two different diets
# To compare the slopes, we look at whether the parameter estimate (b3) of the interaction term (diet_age) is
# significantly different from zero or not. Since b3 is significant, the slopes are different.
# The relationship between age and height is different for children a with protein-rich diet compared to children
# with a protein-poor diet. The protein content in diet clearly has an impact on the relationship between age and
# height of children.














