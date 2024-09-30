#EXERCISE 4
#set your own working directory

#for a simple random sample we may have to open as many cases as the sample
  #size we want as it as it is likely that we select at most 1 can from
  #multiple cases
#logistically, a cluster sampling method makes more sense as long as
  #if we can assume that the proportion defectives in the cases are similar,
  #we can just select a subset of cases, and check all cans per case
  #or a subsample per case
#in this example there is no rationale for stratified random sampling

#import and view the Cans data
Cans=read.csv("Cans.csv",header = T)
View(Cans)

#in the notes I asked you to create an indicator of which case and can numbers
  #were selected and which were not
  #ignore those questions and only select the clusters and the cans per cluster
  #I am not including the SRS question here, you can do an SRS sample yourself
  #if you do this, select a sample of 36, not 140

#randomly select 9 cases from the 60 cases
cases=sort(sample(60,9))
cases

#since we are selecting 4 from 12 cans from each of our 9 selected cases,
  #we can create a loop to do this using less code
  #you do not need to do this, you can create 9 smaller datasets, select the
  #4 cans from each, and combine it all into a single dataset
  #I am giving you the code for the loop
    #I start by initializing the dataset
    #the first loop (i) identifies the 9 cases selected from the Cans data
    #within this look I select a subset of 4 from 12
    #the second loop (j) identifies the 4 cans selected for case (i)
    #within this loop I build the final dataset using the rbind() function
clus_data=numeric()
for(i in 1:length(cases)){
  cans=sort(sample(12,4))
  for(j in 1:length(cans)){
    clus_data=rbind(clus_data,Cans[Cans$CaseNum==cases[i]&Cans$CanNum==cans[j],])
    }
  }

View(clus_data)
str(clus_data)

#determine the proportion defective cans for the population
  #we can only do this because we have all the information, which will not
  #be the case in practice
mean(Cans$Defective)

#estimate the proportion defective cans from the cluster sample
mean(clus_data$Defective)

#you may find that there is potentially a big difference between the
  #actual proportion and the estimated proportion
  #this is why we incorporate the sampling distribution to account for variability
  #perhaps selecting only 4 cans per case is not optimal
  #for a sample of 36, we could select 6 cases with 6 cans per case,
  #or even 3 cases with all cans per case
  #I suspect that a sample of 36 is just too small, perhaps we should increase n
  #you can adapt your code to do this and evaluate the results
