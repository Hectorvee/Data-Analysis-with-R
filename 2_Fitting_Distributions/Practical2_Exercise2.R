#set your own working directory

#EXERCISE 2

#H0:the data follow a normal distribution
#H1:the data do not follow a normal distribution

#import and view the data
BSL=read.csv("BSL.csv",header = T)
View(BSL)

#standardize the data by subtracting mu and dividing by sigma
#but the parameters are unknown
#so we estimate mu and sigma using sample mean and standard deviation
Z_BSL=(BSL$BSL-mean(BSL$BSL))/sd(BSL$BSL)

#the histogram and summary statistics show that the standardized data fall
#in the range (-2,2)
hist(Z_BSL)
summary(Z_BSL)

#create bins (class intervals) of width 0.5, from -2 to +2
#group the standardized data into these bins
#create a frequency table from the grouped data, namely the observed frequencies
zbreaks=seq(-2,2,0.5)
zcut<-cut(Z_BSL,breaks=zbreaks)
z_obs=table(zcut)
z_obs

#for all 8 bins, calculate the probability that the Z falls in that interval
#namely: P(-2<Z<-1.5), P(-1.5<Z<-1),..., P(1.5<Z<2)
#these are the expected probabilities under the null hypothesis assumption
#you can do this separately for each bin, or using a loop
z_exp=numeric(0)
for(i in 1:length(zbreaks)-1){
  z_exp[i]=(pnorm(zbreaks[i+1])-pnorm(zbreaks[i]))
}

#to ensure that the probabilities all add to 1 we must include to two tail areas
#add P(Z<-2) to P(-2<Z<-1.5), i.e., the first class interval
#add P(Z>+2) to P(1.5<Z<2), i.e., the last class interval (I used symmetry to do this)
z_exp[1]=z_exp[1]+pnorm(zbreaks[1])
z_exp[8]=z_exp[8]+pnorm(zbreaks[1])
z_exp
sum(z_exp)

#apply the Chi-squared goodness-of-fit test
BSL_out=chisq.test(x=z_obs,p=z_exp)
BSL_out

#check that the minimum expected frequencies >=5
str(BSL_out)
min(BSL_out$expected)

#the p-value for the test statistic of 15.042 and df=6 is 0.03547 (as in the output)
1-pchisq(15.042,7)

#since we estimated mu and sigma, degrees of freedom = 8-2-1=5, not 7
#we need to get the p-value through coding
1-pchisq(15.042,5)

#the p-value is between 0.01 and 0.05 -> reject H0 -> sufficient evidence for H1
#there is strong evidence that the data do not follow a normal distribution
#this is also visually clear from the histogram
