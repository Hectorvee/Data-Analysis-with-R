#EXERCISE 1
#set your own working directory

#import and view the data
Rectangle=read.csv("Rectangle.csv",header = T)
View(Rectangle)

#for my judgement sample of size 5 I choose rectangles 18, 21, 52, 76 and 80
judge_list=c(18,21,52,76,80)
judge_list
judge_set=Rectangle[judge_list,]
judge_set

#average area for my judgement sample = 7.4
judge_ave=mean(judge_set$Area)
judge_ave

#randomly select a simple random sample of size 5, and sort the data
srs_set=Rectangle[sort(sample(nrow(Rectangle),5,replace = FALSE)),]
srs_set

#average area for my simple random sample = 5
srs_ave=mean(srs_set$Area)
srs_ave

#I asked students to capture the judgement and srs means from their samples
#import and view the RectangleMeans dataset with mean from 116 students
RectangleMeans=read.csv("RectangleMeans.csv",header = T)
View(RectangleMeans)

#calculate averages for population and sample means
all_means=rbind(mean(Rectangle$Area),mean(RectangleMeans$judge),mean(RectangleMeans$srs))
all_means

#create a plot with all 3 histograms and a multiple boxplot with means
#use the mfrow function
#if you try to add the graphs below, you may get the following message:
#Error in plot.new() : figure margins too large
#this means the plot panel is too small for the margins of the plots we want
#By default, the par() function in R sets the margins of a plot as follows:
#  Bottom margin: 5.1
#  Left margin: 4.1
#  Top margin: 4.1
#  Right margin: 2.1
#we can change the margins with the code below
par(mfrow=c(2,2))
par(mar = c(2, 2, 2, 2))
hist(Rectangle$Area,main = "Rectangle size distribution",
  cex.main=0.7,cex.axis=0.7)
boxplot(Rectangle$Area, RectangleMeans$judge, RectangleMeans$srs,
  main = "Multiple boxplots for comparision",cex.main=0.7,cex.axis=0.7,
  at = c(1,2,3),
  names = c("Population", "Judgement", "SRS"),
  las = 1,
  col = c("green","red","orange"),
  border = "brown",
  notch = TRUE)
points(all_means, pch=20, cex=1.5,col="blue")
text(x=c(1,2,3),y=all_means+2,labels=paste("Mean=",round(all_means,1)),cex=0.7)
hist(RectangleMeans$judge,main = "Judgement sample means",
  cex.main=0.7,cex.axis=0.7)
hist(RectangleMeans$srs,main = "SRS sample means",cex.main=0.7,cex.axis=0.7)

#reset the graphical parameters to the default
dev.off()

#The first thing to note is that the rectangle sizes range from 1 to 18
min(Rectangle$Area)
max(Rectangle$Area)

#The sample means for both judgement and srs samples have extreme values
#Do you think it is possible to get sample means greater than 18?
#Such numbers could have been entered incorrectly in the survey
#Or the average of the rectangle number was calculated instead of the size
#Or there was some other error in the sampling code
#We must first fix/remove the errors before calculating the averages that I added on the boxplot for the sample means are misleading
