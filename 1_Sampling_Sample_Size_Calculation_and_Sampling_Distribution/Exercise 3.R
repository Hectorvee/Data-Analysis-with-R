## Stratified random sampling

# Select a stratified random sample of size n = 6, without replacement, from the iris dataset, proportional to the
# three different iris species:

#determine the sample size per species
View(iris)

freq_table <- table(iris$Species) # 50 per species

prop <- prop.table(freq_table) # This is the proportion of each species

strat_freq <- 6*prop # This is the number of samples per species
strat_freq


#create data frame for each species
setosa <- iris[iris$Species == "setosa", ]
versicolor <- iris[iris$Species == "versicolor", ]
virginica <- iris[iris$Species == "virginica", ]

#select individual sample sizes from each species subset and combine into a single data frame
set.seed(1234567)
setosa_strat <- setosa[sort(sample(nrow(setosa), strat_freq["setosa"])), ]
versicolor_strat <- versicolor[sort(sample(nrow(versicolor), strat_freq["versicolor"])), ]
virginica_strat <- virginica[sort(sample(nrow(virginica), strat_freq["virginica"])), ]

strat <- rbind(setosa_strat, versicolor_strat, virginica_strat)
strat

# Exercice 3

data_summary <- function (data) {
  print(str(data))     # Check the structure of the data
  print(summary(data)) # Check the summary of the data
  print(head(data))    # Check the first few rows of the data
}



# The Demographic.csv data file contains the heights and gender of 1600 people in an artificial population.
demographic <- read.csv("Demographic.csv", header = TRUE)
View(demographic)
data_summary(demographic)

population_mean <- mean(demographic$height)


# 1. Select a simple random sample of size n = 80 (5% of the population) and estimate the average height.
demo_srs <- demographic[sample(nrow(demographic), 80),]
srs_mean <- mean(demo_srs$height)

# 2. Select a stratified random sample of size n = 80 (5% of the population), proportional to the gender
# distribution in the population, and estimate the average height.
freq_table <- table(demographic$gender)
prop <- prop.table(freq_table)
gender_freq <- 80*prop
gender_freq

male <- demographic[demographic$gender == "M",]
female <- demographic[demographic$gender == "F",]

male_strat <- male[sort(sample(nrow(male), gender_freq["M"])), ]
female_strat <- female[sort(sample(nrow(female), gender_freq["F"])), ]
gender_strat <- rbind(male_strat, female_strat)
gender_strat

strat_mean <- mean(gender_strat$height)
strat_mean

# 3. Compare the estimates from the two sampling methods with the actual average height of the population,
# and comment on the results.
abs(strat_mean - population_mean)
abs(srs_mean - population_mean)



















