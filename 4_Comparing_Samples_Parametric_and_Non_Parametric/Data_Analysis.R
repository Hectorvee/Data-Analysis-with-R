# Data Analysis Project: Parametric vs. Non-Parametric Tests

# 1. One-Sample Tests
# Dataset: sleep: extra hours of sleep for Drug 1 and Drug 2.
data(sleep)
View(sleep)
# Compare the extra hours of sleep for Drug 1 against a population value (0).
# - Test whether the average or median of extra hours of sleep is different from 0.
# H_o: μ(Drug_1) = 0 vs H_a: μ(Drug_1) != 0
drug1 <- sleep$extra[sleep$group == 1]
drug2 <- sleep$extra[sleep$group == 2]

# Check assumptions

# Test for normality
# H_o: Data is normally distributed vs H_a: Data is not normally distributed
shapiro.test(drug1)
# Since p-value is 0.4079 which is greater than 0.05, we fail to reject null
# hypothesis concluding that the data is normally distributed

# Test outliers
boxplot(drug1, main="Drug 1")
plot(drug1, main="Drug 1")

# Run test
# H_o: μ(Drug_1) = 0 vs H_a: μ(Drug_1) != 0
t.test(drug1, mu=0)
# Since p-value is 0.2176 which greater than 0.05, we fail to reject H_o concluding that
# the average of extra hours of sleep is 0.

# 2. Two Independent Sample Tests
# Dataset: iris: Sepal Length for three species: setosa, versicolor, and virginica.
data(iris)
View(iris)
# Compare the Sepal Length between two species: setosa and versicolor.
setosa <- iris$Sepal.Length[iris$Species == "setosa"]
versicolor <- iris$Sepal.Length[iris$Species == "versicolor"]
# - Test if there is a significant difference in sepal length between the two species.

# Check assumptions

# Check normality
# H_o: Data is normally distributed vs H_a: Data is not normally distributed
shapiro.test(setosa)
# Since p-value is 0.4595 which is greater than 0.05, we fail to reject null
# hypothesis concluding that the data is normally distributed

shapiro.test(versicolor)
# Since p-value is 0.0.4647 which is greater than 0.05, we fail to reject null
# hypothesis concluding that the data is normally distributed

# Check equality of variance
var.test(setosa, versicolor)
# Since the p-value is 0.008657 which is less than 0.05, we reject the H_o concluding
# that variances are not equal

# Run test
wilcox.test(setosa, versicolor, exact=FALSE)
# Since p-value is less than 0.05, we reject the H_o concluding that
# there is a significant difference in sepal length between the two species

# 3. Multiple Independent Sample Tests
# Dataset: ToothGrowth: Tooth length for three dose levels of Vitamin C (0.5, 1, and 2).
data(ToothGrowth)
View(ToothGrowth)
# Compare the effect of Vitamin C on tooth growth across three dose levels (0.5, 1, and 2).
# - Test if there is a significant difference in tooth growth across the three dose levels.
# H_o: There is no significant difference in tooth growth across the three dose levels
# H_a: There is significant difference in tooth growth across the three dose levels
VC_0_5 <- ToothGrowth$len[ToothGrowth$dose == "0.5" & ToothGrowth$supp == "VC"]
VC_1 <- ToothGrowth$len[ToothGrowth$dose == "1" & ToothGrowth$supp == "VC"]
VC_2 <- ToothGrowth$len[ToothGrowth$dose == "2" & ToothGrowth$supp == "VC"]
VC <- ToothGrowth[ToothGrowth$supp == "VC",]

# Check assumptons
# Check mormality
# H_o: Data is normally distributed vs H_a: Data is not normally distributed
shapiro.test(VC_0_5)
# p-value = 0.1696: Fail to reject H_o: Data is normally distributed

shapiro.test(VC_1)
# p-value = 0.2698: Fail to reject H_o: Data is normally distributed

shapiro.test(VC_2)
# p-value = 0.9194: Fail to reject H_o: Data is normally distributed

# Check for equality of variance
bartlett.test(len ~ dose, data=VC)
bartlett.test(list(VC_0_5, VC_1, VC_2))

# Outliers
boxplot(VC_0_5, VC_1, VC_2, col=c("red", "green", "blue"))

# Run the test
anova <- aov(len ~ dose, data=VC) # If assumptions are met
summary(anova)
# p-value = 1.51e-11: Reject H_o: There is significant difference in tooth growth across the three dose levels

KR <- kruskal.test(len ~ dose, data=VC) # If assumptions are not met
KR
# p-value = 3.594e-06: Reject H_o: There is significant difference in tooth growth across the three dose levels

# 4. Correlation
# Dataset: mtcars: Miles per gallon (mpg) and Horsepower (hp) of cars.
data(mtcars)
View(mtcars)
# Investigate the relationship between miles per gallon (mpg) and horsepower (hp).
# - Test if there is a significant correlation between mpg and hp.

plot(mtcars$mpg, mtcars$hp, main="Scatterplot of gallon (mpg) and horsepower (hp)")

# Check for normality
shapiro.test(mtcars$mpg)
# p-value = 0.1229: Normally distributed

shapiro.test(mtcars$hp)
# p-value = 0.04881: Not normally distributed

cor.test(mtcars$mpg, mtcars$hp, method = "spearman", exact = FALSE)
# p-value = 5.086e-12: Reject H_o: There is a significant correlation between mpg and hp.
cor.test(mtcars$mpg, mtcars$hp, method = "kendall", exact = FALSE)
# p-value = 4.332e-09: Reject H_o: There is a significant correlation between mpg and hp.
