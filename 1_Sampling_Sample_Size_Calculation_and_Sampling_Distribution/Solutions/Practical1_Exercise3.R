setwd("1_Sampling_Sample_Size_Calculation_and_Sampling_Distribution")
#EXERCISE 3
#set your own working directory

#import and view the Demographic data
Demographic=read.csv("../data/Demographic.csv", header = T)
View(Demographic)
prop.table(table(Demographic$gender))

#select a simple random sample of size n=80
DEMO_srs=Demographic[sort(sample(nrow(Demographic),80,replace = FALSE)),]
View(DEMO_srs)
prop.table(table(DEMO_srs$gender))
table(DEMO_srs$gender)

#determine the stratified sample proportional to strata (gender)
#if the sample allocation per group is not an integer, round off the values
strat_freq=80*prop.table(table(Demographic$gender))
strat_freq

#create a dataset for each gender group
DEMO_male=Demographic[Demographic$gender=="M",]
DEMO_female=Demographic[Demographic$gender=="F",]
table(DEMO_male$gender)
table(DEMO_female$gender)

#select a stratified sample of size n=80, proportional to gender
strat_male=DEMO_male[sort(sample(nrow(DEMO_male),strat_freq["M"])),]
strat_female=DEMO_female[sort(sample(nrow(DEMO_female),strat_freq["F"])),]
DEMO_strat=rbind(strat_male,strat_female)
table(DEMO_strat$gender)

#calculate the means from the population and the two sampling methods
mean(Demographic$height)
mean(DEMOsrs_set$height)
mean(DEMO_strat$height)
