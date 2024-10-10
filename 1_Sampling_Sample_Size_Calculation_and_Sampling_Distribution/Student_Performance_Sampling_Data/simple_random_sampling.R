## Simple Random Sampling
# Simple random sampling is a type of probability sampling where each element in the population has an equal chance of
# being selected. This is done by assigning a unique number to each element in the population and then randomly
# selecting the required number of elements. In this exercise, we will use simple random sampling to select a sample
# from the population of rectangles and compare the mean area of the sample to the mean area of the population.

# Useful functions
data_summary <- function (data) {
  print("Structure of the data:")
  print(str(data))     # Check the structure of the data
  print("Summary of the data:")
  print(summary(data)) # Check the summary of the data
  print("First few rows of the data:")
  print(head(data))    # Check the first few rows of the data
}

# Import the data
performances <- read.csv("1_Sampling_Sample_Size_Calculation_and_Sampling_Distribution/Student_Performance_Sampling_Data/StudentPerformanceFactors.csv", header=TRUE)
View(performances)
data_summary(performances)

# Simple random sample Gender
male_dataframe <- performances[performances$Gender == "Male", ]
View(male_dataframe)

male_sample <- male_dataframe[sort(sample(nrow(male_dataframe), 100, replace = FALSE)), ]
View(male_sample)

female_dataframe <- performances[performances$Gender == "Female", ]
View(female_dataframe)

female_sample <- female_dataframe[sort(sample(nrow(female_dataframe), 100, replace = FALSE)), ]
View(female_sample)


## Systematic random sampling
