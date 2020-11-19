source("activation_functions.R")

x <- -10:10
y <- rectified_linear_function(x)
plot(x,y, type="l", main="Rectified Linear Unit (ReLU)")

# Why?
# https://machinelearningmastery.com/rectified-linear-activation-function-for-deep-learning-neural-networks/
# Answer: strengthens weak signals by only letting positive values through.

