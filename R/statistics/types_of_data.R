# WHY DO WE CARE?
# Constrains what mathematics we can do with the type of data.
#
# Important questions:
# 
# How am I going to collect the data?
# How am I going to summarise the data?
# How am I going to visualise the data?

# There are different types of data we can encounter.
# Some are countable, some are not.

library(mltools)
library(data.table)
library(datasets)
data(iris)                  # load the iris dataset
class(iris)                 # note this is a data.frame which is like a sheet in Excel.
summary(iris)               # take a range of statistics of the data
names(iris)                 # show columns or "features"
head(iris)                  # show the first n rows

table(iris[["Sepal.Length"]])       # is this categorical or numerical?  Is it discrete, continuous, interval or ratio?
table(iris[["Species"]])            # is this categorical or numerical?

# Categorical (note this tends to be referred to as Qualitative data)
# represents characteristics like gender, language
# can easily be converted to one hot encoding (0,...,1,0,....)
species_one_hot <- one_hot(as.data.table(iris[["Species"]]))

# Categorical - Nominal data
# discrete units, normally some sort of yes/no, what languages do you speak?, what kind of food do you like?
# can easily be converted to one hot encoding (0,...,1,0,....)
# collect through frequencies, proportions or percentages
# visualise with pie charts and bar charts
pie(table(iris[["Species"]]))
barplot(table(iris[["Species"]]))

# Categorical - Ordinal data
# discrete AND ordered units, there may be some hierarchy involved
# e.g. how happy are you today? 1 - Very Unhappy, 2 - Unhappy ,3 - Neutral,4 - Happy or 5 - Very Happy
# can easily be converted to a single integer where the value level has some sort of meaning
# this type of data can either be one hot encoding or a range within 0 to 1
# for example: 1 can be converted to 0 to 0.2, 2 is 0.2 to 0.4, ... 5 will be 0.8 to 1.0.
# collect through frequencies, proportions or percentages
# analyse with percentiles, median and mode and interquartile ranges.
# visualise with pie charts and bar charts
user_options <- c( "Very Unhappy", "Unhappy", "Neutral", "Happy", "Very Happy")
selections <- user_options[floor(runif(100, 1, 6))] # note we have to generate to 6 not 5
frequencies <- table(selections)                            # counts
proportions <- table(selections)/length(selections)         # between 0 and 1
percentages <- proportions * 100                            # between 0 and 100 (unless dealing with growth)
barplot(frequencies)
# to get statistics we need to be able to convert our labels into numbers
selections_as_factor <- factor(selections, levels=c("Very Unhappy", "Unhappy", "Neutral", "Happy", "Very Happy"), ordered=TRUE)
median(as.numeric(selections_as_factor))        ## method one, a bit of hack but good to know
library(missMethods)
median(selections_as_factor)                              ## replaces missing ordered factor median function, so more natural
quantile(selections_as_factor, probs=c(0,1,0.25), type=1)        ## inter-quartile ranges, aka quantiles
# note that R does not have  mode function but that is easily fixed
# but it does have a mode function so we cannot use that as our function name
stats_mode <- function(x) {
    unique_x <- unique(x)
    return ( unique_x[which.max(tabulate(match(x,unique_x)))])
}
stats_mode(selections)

# Numerical (note this tends to be referred to as Quantitative data)
# represents things that can be measured or counted.

# Numerical - Discrete
# countable values, number of coin flips, age
# can you count it?
# can it be divided into smaller amounts or not?
# visualise with pie charts and bar charts
flips <- runif(100, 0, 1)
heads <- rep(NA, length(flips))
heads[which(flips<0.5)] = "T"
heads[which(flips>=0.5)] = "H"
barplot(table(heads))

# Numerical - Continuous
# measureable, but not countable.
# examples: length of a countries border, height
# you can show this on a continuous line.
# can use percentiles, median, interquartile range, mean, mode, standard deviation, and range
# Visualise using histograms or box-plots. With a histogram, you can check the central tendency, variability, modality, and kurtosis of a distribution. 
# Use a box-plot to show outliers.



# Numerical - Continuous - Interval
# ordered units have the same difference
# e.g. temperature: -10,-5,0,5,10,15 all have the difference 5.
# there is no true zero value, e.g. there is no such thing as no height or no temperature
# can add, subtract
# do not multiply, divide or calculate ratios

# Numerical - Continuous - Ratio
# ordered units with the same difference but do have a true zero
# e.g. weight, length
# most physical phenomena can be approximated with a normal distribution
# can add, subtract, multiply, divide, calculate ratios



heights <- rnorm(10000,2,0.1)
hist(heights)
boxplot(heights)
summary(heights)
var(heights)            # variance
sd(heights)             # standard deviation (square-root of the variance)
library(moments)
# https://www.geeksforgeeks.org/skewness-and-kurtosis-in-r-programming/
skewness(heights)                   # measures where the body of values lie with respect to the middle, how symmetric is it
                                    # value > 0, POSITIVELY SKEWED, most values are LESS THAN mean
                                    # value < 0, NEGATIVELY SKEWED, most values are MORE THAN mean
                                    # value = 0, NOT SKEWED, most values are SYMMETRIC around the mean
kurtosis(heights)                   # measures how sharp the peak is
                                    # value < 3, flat-topped
                                    # value ~ 3, "normal" curve
                                    # value > 3, sharp peak that what a "normal" curve would have

leptokurtic <- c(rep(61, each = 2), rep(64, each = 5), rep(65, each = 42), rep(67, each = 12), rep(70, each = 10)) 
platykurtic <- c(rep(61, each = 10), rep(64, each = 18),  rep(65, each = 23), rep(67, each = 32), rep(70, each = 27), rep(73, each = 17)) 
mesokurtic <- heights

par(mfrow=c(3,1))
plot(density(platykurtic), main=paste("platykurtic (<3), ", kurtosis(platykurtic)))
plot(density(mesokurtic), main=paste("mesokurtic (~3), ", kurtosis(mesokurtic)))
plot(density(leptokurtic), main=paste("leptokurtic (>3), ", kurtosis(leptokurtic)) )
par(mfrow=c(1,1))



