#EXERCISE 9
#set your own working directory

#create a vector of heights
heights=c(141,156.5,162,159,157,143.5,154,158,140,142,150,148.5,138.5,161,153,
          145,147,158.5,160.5,167.5,155,137)
heights

#summary statistics and graphs
#the distribution is possible bimodal
#the distribution is not symmetric
summary(heights)
hist(heights)
boxplot(heights)

#select 2 bootstrap samples
#ignore the part in the notes asking for the list of observations from the data
B_set1=sample(heights,22,replace=TRUE)
B_set2=sample(heights,22,replace=TRUE)
B_2=rbind(summary(heights),summary(B_set1),summary(B_set2))
row.names(B_2)=c("Heights","Bootstrap sample 1","Bootstrap sample 2")
B_2

#select 100 bootstrap samples and combine median and mean values in a dataframe
B_100=numeric()
for(i in 1:100){
  B_sample=sample(heights,22,replace=TRUE)
  B_100=rbind(B_100,c(median(B_sample),mean(B_sample)))
}
B_100=as.data.frame(B_100)

#add row and column names, and view the data
B_names=numeric()
for(i in 1:100){
  B_names[i]=paste("Bootstrap sample ",i)
}
row.names(B_100)=B_names
colnames(B_100)=c("Median","Mean")
View(B_100)

#plot histogram and boxplot for medians and means from bootstrap samples
#note that I am setting the y-axis limits so that graphs are comparable
par(mfrow=c(2,2))
par(mar = c(2, 2, 2, 2))
hist(B_100$Median,main = "Median values",cex.main=0.7,cex.axis=0.7,ylim=c(0,20))
hist(B_100$Mean,main = "Mean values",cex.main=0.7,cex.axis=0.7,ylim=c(0,20))
boxplot(B_100$Median,main = "Median values",cex.main=0.7,cex.axis=0.7,
        ylim=c(140,160))
boxplot(B_100$Mean,main = "Mean values",cex.main=0.7,cex.axis=0.7,
        ylim=c(140,160))

#reset the graphical parameters to the default
dev.off()

#estimate means and standard deviation for the bootstrap samples
B_100_summary=cbind(rbind(mean(B_100$Median),sd(B_100$Median)),
                    rbind(mean(B_100$Mean),sd(B_100$Mean)))
row.names(B_100_summary)=c("Average","Standard deviation")
colnames(B_100_summary)=c("Median","Mean")
B_100_summary



