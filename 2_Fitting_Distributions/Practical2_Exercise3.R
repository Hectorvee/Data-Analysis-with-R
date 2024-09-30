#EXERCISE 3

#use the standardized data from exercise 2

#plot the empirical cdf of the data
plot(ecdf(Z_BSL)) 

#add the theoretical cdf of the standard normal distribution
curve(pnorm, from = -2, to = 2,add = T)

#the cdf of the normal distribution is S-shaped
#if the data conformed to the normal distribution, the ecdf would be S-shaped
#this is clearly not the case
#we have seen in exercise 2 that the data are not normally distributed
#the ecdf confirms that result
