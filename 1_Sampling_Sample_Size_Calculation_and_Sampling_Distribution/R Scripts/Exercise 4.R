setwd("1_Sampling_Sample_Size_Calculation_and_Sampling_Distribution")
## Cluster Random Sampling

# For illustration purposes, we assume that the three different iris species represent clusters, such that the
# measurements within each species are diverse but similar across species. Select a cluster random sample of size
# n = 6, without replacement, from the iris dataset, where all sampling units are selected from one of the three iris
# species (clusters):

#randomly select 1 of the 3 clusters
set.seed(1234567)
random_species <- sample(iris$Species, 1)
random_species

#create a data frame for the cluster
cluster1 <- iris[iris$Species == random_species,]
cluster1

#select a sample of size 6 from the cluster
clust <- cluster1[sort(sample(nrow(cluster1), 6)),]
clust

# Exercise 4
# A manufacturing plant produces aluminium cans that are sold to other factories to fill with canned goods. The
# cans are packaged in cases, and each case contains 12 cans. As part of the quality control, the quality control
# inspector selects a random sample of cans at the end of the production cycle to estimate the proportion of defective
# cans produced during the cycle. It is generally assumed that the plant produces defective cans independently from
# one another during a cycle. The Cans.csv data file contains the population data for 60 cases of cans produced
# during a single production cycle. Note, this level of information is typically not available and is given to you for
# illustration purposes.

can_data <- read.csv("data/Cans.csv")
View(can_data)

data_summary <- function (data) {
  print(str(data))     # Check the structure of the data
  print(summary(data)) # Check the summary of the data
  print(head(data))    # Check the first few rows of the data
}

data_summary(can_data)

# 1. Which sample methodology do you think is the best approach to use for this problem in terms of cost,
# time and representation: simple random sampling, systematic sampling stratified random sampling or
# cluster sampling? Justify your answer.
# Answer: Cluster sampling is the best approach to use for this problem in terms of cost, time and representation.

# 2. Use cluster sampling to randomly select 5% of the cans produced during the cycle:
# a) Total number of cans = 60 × 12 = 720 → 5% of cans produced = 720 × 0.05 = 36
sample_size <- nrow(can_data)*0.05

# b) Randomly select 9 cases, then randomly select 4 cans from each case
case_list <- sort(sample(60, 9))
sample_data <- data.frame() # Initialize an empty data frame to store the sample data

for (i in case_list) {
  sample_cans <- can_data[can_data$CaseNum == i, ] # Select all cans from the current case
  srs_cans <- sample_cans[sort(sample(nrow(sample_cans), 4)),] # Randomly select 4 cans from the current case
  sample_data <- rbind(sample_data, srs_cans) # Append the selected cans to the sample data
}

sample_data
nrow(sample_data)

# c) Create a bar graph of the number of cans selected per case
barplot(table(sample_data$CaseNum), main="Number of cans selected per case", xlab="Case Number", ylab="Number of Cans")
# hist(sample_data$CaseNum, main="Number of cans selected per case", xlab="Case Number", ylab="Number of Cans")
# barplot(table(sample_data$CanNum), main="Number of cans per case", xlab="Case Number", ylab="Number of Cans")


# d) Estimate the proportion of defective cans using the sample information
defective_proportion_population <- mean(can_data$Defective)
defective_proportion_population

#3. Use simple random sampling to randomly select 1% of the cans produced during the cycle:
# a) Randomly select n = 140 cans
srs_sample <- can_data[sort(sample(nrow(can_data), 140)),]

# b) Create a bar graph of the number of cans selected per case
barplot(table(srs_sample$CaseNum), main="Number of cans selected per case", xlab="Case Number", ylab="Number of Cans")

# c) Estimate the proportion of defective cans using the sample information
defective_proportion_srs <- mean(srs_sample$Defective)
defective_proportion_srs

# 4. Compare the two estimates from the two different sampling methodologies with the true proportion of
# defective cans produced during the production cycle.
# a) Calculate the absolute difference between the sample estimates and the true proportion
abs_diff_cluster <- abs(defective_proportion_population - mean(sample_data$Defective))
abs_diff_srs <- abs(defective_proportion_population - mean(srs_sample$Defective))
# Interpretation: The absolute difference between the sample estimates and the true proportion of defective cans is
# 0.0458 for cluster sampling and 0.0129 for simple random sampling. The cluster sampling estimate has a higher absolute difference.


