# Never use all your data when finding/training a model
library(datasets)
data(iris)
independent <- iris$Sepal.Length
dependent <- iris$Petal.Length

# LEARNING PHASE
# get linear model (same as lsfit)
# note we use the first 100 rows to TRAIN or FIT our model.
linear_model <- lm(Petal.Length~Sepal.Length,iris[1:100,])
newdata=iris[101:150,]

# VALIDATION PHASE
# in machine learning we also have VALIDATION sets which are 
# used to tune our model hyper-parameters.
# Hyper-parameters include number of hidden units in a layer,
# the learning rate, number of layers.
# This data only affects learning INDIRECTLY and is tuning 
# the learning algorithm.

# TEST PHASE
# we predict but giving our MODEL some new data to work on 
# that we know the answer to.  This is our TEST set.
predictions <- predict(linear_model, newdata)
errors <- iris$Petal.Length[101:150] - predictions
hist(errors)
total_error <- sum(abs(iris$Petal.Length[101:150] - (predictions)))
# we always have predictions and errors here and
# its important to know the distribution of errors so we know
# where the most risk is.

