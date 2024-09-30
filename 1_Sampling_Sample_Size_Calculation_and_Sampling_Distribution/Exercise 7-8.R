## Hypothesis testing method
library(pwr)
pwr.t.test(n=NULL, d=0.5, sig.level=0.05, power=0.8, type="two.sample")

pwr.p.test(h=0.3, sig.level=0.05, power=0.8, alternative="two.sided")

ES.h(0.3, 0.5)


# ---------- Exercise 7 ----------
# A researcher hypothesizes that fasting blood glucose for people without diabetes increases if they drink at least
# two cups of coffee per day. Previous studies have shown that the mean fasting blood glucose level in people free
# of diabetes is 95 mg/dL with a standard deviation of 9.8 mg/dL. If the mean fasting blood glucose level in people
# free of diabetes who drink at least two cups of coffee per day is 100 mg/dL, this would be viewed as significant
# from a practical perspective. How large a sample must be selected to ensure that the power of the test is 80% to
# detect this difference at a 5% level of significance? Look at how the format of the alternative hypothesis relates
# to the effect size value calculation.

power <- 0.8
alpha <- 0.05
standard_deviation <- 9.8
mu_0 <- 95
mu_1 <- 100
effect_size <- (mu_1 - mu_0) / standard_deviation
# Formula
pwr.t.test(n=NULL, d=effect_size, sig.level=alpha, power=power, type="one.sample", alternative="greater")
pwr.t.test(n=NULL, d=effect_size, sig.level=alpha, power=power, type="one.sample", alternative="two.sided")
pwr.t.test(n=NULL, d=effect_size, sig.level=alpha, power=power, type="one.sample", alternative="less")


# ---------- Exercise 8 ----------
# A medical device manufacturer produces implantable stents. Historical records showed that approximately 10%
# of the stents are defective. The quality control manager believes that this is no longer the case. A pilot sample
# showed that 13% of stents are defective. Calculate the sample size that will ensure that the appropriate hypothesis
# test at a 1% level of significance has 85% power to detect a 0.03 difference. Then calculate the sample size for
# the same criteria for small, medium and large effect sizes.
p_0 <- 0.1
p_1 <- 0.13
alpha <- 0.01
power <- 0.85
effect_size <- 0.03
# Formula
h <- ES.h(p_0, p_1)
h
pwr.p.test(h=h, sig.level=alpha, power=power, alternative="two.sided")
pwr.p.test(h=0.2, sig.level=alpha, power=power, alternative="two.sided")


