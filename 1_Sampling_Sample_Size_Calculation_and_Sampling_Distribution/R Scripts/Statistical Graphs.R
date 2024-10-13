### Statistical Graphs and their Interpretation
View(iris)

## 1. Histograms
# Description:
# Histograms are used to display the distribution of a continuous variable. The x-axis represents the range of values of
# the variable, and the y-axis represents the frequency or count of observations falling within each range. The shape of
# the histogram can provide insights into the underlying distribution of the data, such as whether it is symmetric,
# skewed, or multimodal.

# Interpretation:
# Shape: Reveals the shape of the data distribution (e.g., normal, skewed, bimodal).
# Central Tendency: Helps identify where most data points fall.
# Spread: Indicates the range and dispersion of the data.
# Outliers: Can help detect any extreme values or anomalies.

# Example:
hist(iris$Sepal.Length, main="Histogram of Sepal Length", xlab="Sepal Length", ylab="Frequency")

## 2. Boxplots
# Description:
# A boxplot summarizes the distribution of a continuous variable through its quartiles. It displays the median,
# quartiles, and possible outliers.

# Interpretation:
# Median: The central line in the box shows the median value.
# Interquartile Range (IQR): The width of the box represents the IQR (middle 50% of the data).
# Whiskers: Extend to the smallest and largest values within 1.5 times the IQR from the quartiles.
# Outliers: Points outside the whiskers are considered outliers.

# Example:
boxplot(iris$Sepal.Length, iris$Sepal.Width, main="Boxplot of Sepal Length", xlab="Species", ylab="Sepal Length")

## 3. Scatter Plot
# Description:
# A scatter plot displays the relationship between two continuous variables. Each point represents a pair of values
# from the variables.

# Interpretation:
# Correlation: Shows the strength and direction of the relationship between variables (positive, negative, or none).
# Trends: Helps identify patterns or trends in the data.
# Clusters: Can reveal groupings or clusters in the data.
# Direction: Indicates the direction of the relationship between variables.
# Form: Describes the overall shape of the relationship (linear, curved, etc.).
# Strength: Indicates how closely the points follow the trend.
# Outliers: Can help identify any unusual or extreme values.

# Example:
plot(iris$Sepal.Length, iris$Petal.Width, main="Scatter Plot of Sepal Length vs. Petal Length", xlab="Sepal Length", ylab="Petal Length")

## 4. Bar Chart
# Description:
# A bar chart displays categorical data with rectangular bars representing the frequency or proportion of each category.

# Interpretation:
# Frequency: Indicates how common each category is.
# Comparison: Allows for comparison between different categories.
# Distribution: Shows the distribution of values across categories.

# Example:
barplot(table(iris$Species), main="Bar Chart of Iris Species", xlab="Species", ylab="Frequency")

# 5. Pie Chart
# Description:
# A pie chart represents the proportion of categories as slices of a circle. Each slice corresponds to the relative size
# of a category.

# Interpretation:
# Proportion: Shows the proportion of each category relative to the whole.
# Comparison: Provides a visual comparison of proportions among categories.

# Example:
pie(table(iris$Species), main="Pie Chart of Species Proportion", col=c("red", "green", "blue"))



