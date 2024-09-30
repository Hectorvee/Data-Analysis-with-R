## Systematic Random Sampling
# For a systematic random sample of size n = 6 from thr iris dataset, the systematic increment is calculated as:
# k = N/n = 150/6 = 25.
# Randomly select a starting point between 1 and 25, thereafter select every 25th observation:
set.seed(1234567)
sys_list <- sample(25, 1)

for (i in 2:6) {
  sys_list[i] <- sys_list[i-1] + 25
}

sys_list

# Select the systematic random sample
sys <- iris[sys_list, ]
sys








