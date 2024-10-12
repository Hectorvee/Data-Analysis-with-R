setwd("../1_Sampling_Sample_Size_Calculation_and_Sampling_Distribution")
## Systematic Random Sampling
# For a systematic random sample of size n = 6 from thr iris dataset, the systematic increment is calculated as:
# k = N/n = 150/6 = 25.
# Randomly select a starting point between 1 and 25, thereafter select every 25th observation:
sys_list <- sample(25, 1)

for (i in 2:6) {
  sys_list[i] <- sys_list[i-1] + 25
}

sys_list

# Select the systematic random sample
sys <- iris[sys_list, ]
sys

#set your working directory

#import ABQ data
set.seed(1234567)
ABQ <- read.csv("data/ABQ.csv", header = TRUE)
View(ABQ)

#sort the ABQ data in path order to create the path
ABQorder <- ABQ[order(ABQ$path),]
View(ABQorder)

#import the coordinates of the area labels
ABQcoord <- read.csv("data/ABQcoord.csv", header = TRUE)
View(ABQcoord)

#plot the map
plot(ABQ$Lattitude,ABQ$Longitude) #plot the map
text(
  x=ABQ$Lattitude,  # x-axis
  y=ABQ$Longitude,  # y-axis
  labels=ABQ$path,  # labels
  pos = 3,        # position
  cex = 0.7      # character expansion (size)
)

# Add the area labels
text(x=ABQcoord$Lattitude,  # x-axis
     y=ABQcoord$Longitude,  # y-axis
     labels=ABQcoord$Name,  # labels
     pos=1,       # position
     cex=0.7,  # character expansion (size)
     col="blue" # color
)

# Add the path
lines(ABQorder$Lattitude, # x-axis
      ABQorder$Longitude, # y-axis
      col="red" # color
)

# 5. Systematic random sampling:
# a) Determine the value k for a sample of size n = 5
k <- nrow(ABQorder)/5

# b) Randomly select a starting point = 1, 2, …, k
ABQsys_list <- sample(k, 1) # Returns a vector (6, 12, 18, 24, 30)

# c) Select every kth location on the path
for (i in 2:5) {
  ABQsys_list[i] <- ABQsys_list[i-1] + k
}

ABQsys_list_2 <- ABQorder[seq(ABQsys_list[1], nrow(ABQorder), by = k), ] # Returns the systematic random sample

# d) Plot the selected sample points
ABQsys_list_set <- ABQorder[ABQsys_list, ]
View(ABQsys_list_set)
points(ABQsys_list_set$Lattitude, # x-axis
       ABQsys_list_set$Longitude, # y-axis
       col="green", # color
       pch=20,  # plot character
       cex=1.5  # character expansion (size)
)

# 6. Simple random sampling:
# a) Select a simple random sample of size n = 5 without replacement from the 30 locations
ABQsrs_set <- ABQorder[sort(sample(nrow(ABQorder), 5, replace = FALSE)), ]
View(ABQsrs_set)

# 7. Plot the sampled locations selected through the two different sampling methodologies on the initial map
# in different colours.
points(ABQsrs_set$Lattitude, # x-axis
       ABQsrs_set$Longitude, # y-axis
       col="red", # color
       pch=8,  # plot character
       cex=1.7  # character expansion (size)
)

# 8. Comment on the resulting samples.
# The systematic random sample is selected at regular intervals along the path, while the simple random sample is
# # selected randomly from the 30 locations. The systematic random sample is more evenly distributed along the path,
# # while the simple random sample may cluster in certain areas. Both samples provide a representative subset of the
# # total locations for further analysis.




















