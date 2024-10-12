setwd("../1_Sampling_Sample_Size_Calculation_and_Sampling_Distribution")

## Simple random sample
set.seed(1234567)
View(iris)

# Select a simple random sample of size n = 6, without replacement, from the iris dataset

srs <- iris[c(1, 3, 5, 7),]
srs
sample(50, 10)

srs <- iris[sort(sample(nrow(iris), 6, replace=FALSE)),]

## Exercise 1
# 1. Import the Rectangle.csv file into R
rectangles <- read.csv("data/Rectangle.csv", header=TRUE)

# 2. Judgment sample:
rect_area_j <- rectangles[c(7, 13, 29, 41, 39), ]
mean(rect_area_j$Area)

# 3. Simple random sample:
rect_area_s <- rectangles[sample(nrow(rectangles), 5, replace=FALSE), ]
mean(rect_area_s$Area)

# 4. For the full dataset (population), the variable of means from the judgment samples, and the variable of
# means from the simple random samples, create a plot of each variable and describe the shape, centre and
# variability of the variable (visually and numerically).

rectangleMeans <- read.csv("data/RectangleMeans.csv", header=T)
rect_data <- round(rectangleMeans, 0) # Might lose some precision
View(rect_data)
hist(rect_data$`ï..judge`)
hist(rect_data$srs)

## Clean data
# Explore the data

data_summary <- function (data) {
  print(str(data))     # Check the structure of the data
  print(summary(data)) # Check the summary of the data
  print(head(data))    # Check the first few rows of the data
}

data_summary(rect_data)

# Check for outliers
rect_data <- rect_data[-which(rect_data$`ï..judge` > 20), ]
rect_data <- rect_data[-which(rect_data$srs > 20), ]
data_summary(rect_data)
hist(rect_data$`ï..judge`)
hist(rect_data$srs)

# Check Missing Values
any(is.na(rect_data)) # Check if there are any NA values
colSums(is.na(rect_data)) # Check the number of NA values in each column

rect_data <- na.omit(rect_data) # Remove NA values
data_summary(rect_data)
hist(rect_data$`ï..judge`)
hist(rect_data$srs)
boxplot(rect_data$`ï..judge`, rect_data$srs)

# Calculate averages for population and sample means
all_means <- rbind(mean(rectangles$Area), mean(rect_data$`ï..judge`), mean(rect_data$srs))
all_means

# Create a plot with all 3 histograms and a multiple boxplot with means
# Use the mfrow function
# If you try to add the graphs below, you may get the following message:
# Error in plot.new() : figure margins too large
# This means the plot panel is too small for the margins of the plots we want
# By default, the par() function in R sets the margins of a plot as follows:
#  Bottom margin: 5.1
#  Left margin: 4.1
#  Top margin: 4.1
#  Right margin: 2.1
# We can change the margins with the code below
par(mfrow=c(2,2)) # Set the layout to 2x2
par(mar = c(2, 2, 2, 2)) # Set the margins to 2

# Create a histogram
hist(rectangles$Area,  # Create a histogram
     main="Rectangle size distribution",  # Set the title
     cex.main=0.7,  # Set the font size for the title
     cex.axis=0.7,  # Set the font size for the axis
)

# Create a multiple boxplot with means
boxplot(rectangles$Area, rect_data$`ï..judge`, rect_data$srs,  # Create a histogram
        main="Rectangle size distribution",  # Set the title
        cex.main=0.7,  # Set the font size for the title
        cex.axis=0.7,  # Set the font size for the axis
        at=c(1, 2, 3), # Set the position of the box-plot
        names=c("Population", "Judgement", "SRS"), # Set the names of the box-plot
        las=3,  # Set the orientation of the axis labels
        col=c("green", "red", "orange"),  # Set the colors of the box-plot
        border="brown",  # Set the border color
        notch=TRUE)  # Set the notch to TRUE

# Add points for the means
points(all_means, # Add points for the means
       pch=30,  # Set the point type
       cex=1.5, # Set the point size
       col="blue" # Set the point color
)

# Add text for the means
text(x=c(1, 2, 3),  # Set the x position of the text
     y=all_means+2,  # Set the y position of the text
     labels=paste("Mean=", round(all_means, 1)),  # Set the labels of the text
     cex=0.7)  # Set the font size of the text

# Create a histogram for the judgement sample means
hist(rect_data$`ï..judge`,  # Create a histogram
     main="Judgement sample means",  # Set the title
     cex.main=0.7,  # Set the font size for the title
     cex.axis=0.7)  # Set the font size for the axis

# Create a histogram for the SRS sample means
hist(rect_data$srs,  # Create a histogram
     main="SRS sample means",  # Set the title
     cex.main=0.7,  # Set the font size for the title
     cex.axis=0.7)  # Set the font size for the axis


str(iris)
summary(iris)
head(iris)