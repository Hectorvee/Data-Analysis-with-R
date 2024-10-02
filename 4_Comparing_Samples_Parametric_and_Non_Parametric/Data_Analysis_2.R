#  Question 1: In a genetic inheritance study discussed by Margolin [1988],
#  samples of individuals from several ethnic groups were taken. Blood samples
#  were collected from each individual and several variables measured. We shall
#  compare the groups labeled Native American and Caucasian with respect to
#  the variable MSCE (mean sister chromatid exchange). The data are as follows:

#  Native American: 8.50 9.48 8.65 8.16 8.83 7.76 8.63
#  Caucasian: 8.27 8.20 8.25 8.14 9.00 8.10 7.20 8.32 7.70

#  Without assuming that the data is normally distributed, test at 0.05 significance
#  level if the mean sister chromatid exchange of Native American and Cau
# casian in the data have identical distributions. [Hint: you may use Wilcoxon
#  rank sum test].

native_american <- c(8.50, 9.48, 8.65, 8.16, 8.83, 7.76, 8.63)
caucasian <- c(8.27, 8.20, 8.25, 8.14, 9.00, 8.10, 7.20, 8.32, 7.70)

wilcox.test(native_american, caucasian)
# Decision: Since p-value is 0.1142 which is greater than 0.05, we fail to reject H_o
# Conclusion: The mean sister chromatid exchange of Native American and Caucasian in the data have identical distributions.


# Question 2: Suppose the National Transportation Saftey board wants to
#  examine the saftey of compact cars (C), mid size cars (M) and full size cars (F).
#  The board collects a sample of seven pressure readings (i.e., the pressure applied
#  to the drivers head during a crash) for each of the treatment (cars types) given
#  as follows.

#  Compact cars: 643 655 702 656 689 678 699
#  Midsize cars: 469 427 525 500 513 489 498
#  Fullsize cars: 484 456 402 450 468 487 459

#  You may use the data in R as follows:
#  Use =5%.

compact_cars <- c(643, 655, 702, 656, 689, 678, 699)
midsize_cars <- c(469, 427, 525, 500, 513, 489, 498)
fullsize_cars <- c(484, 456, 402, 450, 468, 487, 459)
car <- data.frame(car_types = c(rep("C", 7), rep("M", 7), rep("F", 7)), pressure = c(compact_cars, midsize_cars, fullsize_cars))

# Check normality
shapiro.test(compact_cars)
shapiro.test(midsize_cars)
shapiro.test(fullsize_cars)

# Check for variance
bartlett.test(list(compact_cars, midsize_cars, fullsize_cars))

# Check for outlires
boxplot(compact_cars, midsize_cars, fullsize_cars)

# Run test
anova <- aov(pressure ~ car_types, data = car)
summary(anova)
# Decision: Since p-value is 0.000 which is less than 0.05, we reject H_o
# Conclusion: There is significant difference in pressure applied to the drivers head during a crash between the three car types.















