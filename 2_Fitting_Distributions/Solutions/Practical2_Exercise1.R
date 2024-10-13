#set your own working directory

#EXERCISE 1

#H0:the data follow a Poisson distribution
#H1:the data do not follow a Poisson distribution

#import and view the data
child=read.csv("../data/child.csv", header = T)
View(child)
table(child$children)

#estimate the parameter lambda using the sample mean (x-bar=1.78)
mean(child$children)

#make a frequency table of the variable
table(child$children)

#the variable has values 0 to 5, but low frequency with the value 5
#it is better to combine values 4 and 5 into 1 category "4+"

#make a copy of the original data, recode value 5 as a value 4
child2=child
child2$children[child$children==5]=4

#make a table of the variable, which will be the observed input of the Chi-squared test
child_observed=table(child2$children)
child_observed

#calculate the Poisson probabilities for values 0 to 3 where lambda=1.78
#then attach the Poisson probability P(X>=4)
#all probabilities now add up to 1
#these are the expected probabilities under the Poisson(1.78) assumption in H0
child_expected=dpois(c(0,1,2,3),1.78)
child_expected=c(child_expected,1-sum(child_expected))
child_expected
sum(child_expected)

#apply the Chi-squared goodness-of-fit test
child_out=chisq.test(x=child_observed,p=child_expected)
child_out

#check that the minimum expected frequencies >=5
str(child_out)
min(child_out$expected)

#the p-value for the test statistic of 2.0846 and df=4 is 0.7202 (as in the output)
1-pchisq(2.0846,4)

#since we estimated lambda, degrees of freedom = 5-1-1=3, not 4
#we need to get the p-value through coding
1-pchisq(2.0846,3)

#the p-value > 0.1 -> fail to reject H0 -> insufficient evidence for H1
#we can conclude that the data seem to follow a Poisson distribution with rate 1.78
#note, we have not proven this completely, but there is noting in the data to suggest otherwise
