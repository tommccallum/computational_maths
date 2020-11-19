#
# Reference: https://datacadamia.com/lang/r/cluster
#            https://machinelearningmastery.com/implement-perceptron-algorithm-scratch-python/
#

# key insight: a line can be described as linear combination 

# define the random seed so we can reproduce the random data
set.seed(101)
# generate 200 points with mean 100, std. 2
sampleData=matrix(rnorm(100*2),100,2)
# pick 2 of the points to be cluster centers
target=sample(1:2,100,replace=TRUE)
# take mean of each cluster
clusterMeans=matrix(rnorm(3*2,sd=4),3,2)
clusterdata=sampleData+clusterMeans[target,]
clusterdata[which(target==1)]=clusterdata[which(target==1)]+5
clusterdata[which(target==1),2]=clusterdata[which(target==1),2]+5
plot(clusterdata,col=target,pch=19, ylim=c(-8,8), xlim=c(-8,8))
points(clusterdata, col=target, type="p", pch=19)

# example classification line
# abline(h=0)

# must be in the right directory to run
source("activation_functions.R")

activation_function <- function(x) {
    # swap between the default and the logistic and the tanh
    return ( default_function(x) )
}



# Function that does our prediction for us based 
# on our linear expression
predict_cluster <- function(row, weights, bias=0) {
    # this is where we calculate the linear combination
    excitement <- sum(weights * row) + bias
    # this is our decision making mechanism
    # we can transform this activation with a sigmoid or a threshold
    # function or anything else...
    return ( activation_function(excitement) )
}

# train our perceptron
# training_data is going to be our columns in our spreadsheet, without the output result.
# learning_rate is a fudge factor that represents how quickly we might get to an answer, however too fast and we will hop over it and miss the answer.
# num_epochs is the number of time we will go over our data. 
train_weights_on_perceptron <- function(training_data, true_output, learning_rate, num_epochs) {
    # generate some random weights, the length is the number of columns in our training data
    current_weights <- runif(length(training_data[1,]))

    # loop over our data num_epochs times
    for( epoch in 1:num_epochs) {
        # this is where we sum over all the distances between our 
        # data and the new line.
        sum_error <- 0
        for ( row in 1:nrow(training_data) ) {
            # we need to find out where the current curve would categorise our
            # training point.
            prediction <- predict_cluster( training_data[row,], current_weights ) + 1
            # calculate what the distance between where we want to be and where we are currently.
            error <- true_output[row] - prediction

            # plot intermediate line
            x <- seq(-8,8,by=0.1)
            y <- seq(-8,8,by=0.1)
            z <- current_weights[1] * x + current_weights[2] * y
            lines(x,z,col="orange", lwd=3, lty=2)

            # we want to keep a tally of our error across all inputs
            # we take the absolute or square the error
            sum_error <- sum_error + (error)^2

            # where we spread the error backwards to the weights
            # KEY LINE TO UNDERSTAND
            current_weights <- (learning_rate * error * training_data[row,]) + current_weights
        }
        print(paste("epoch", epoch, "error", sum_error))
    }
    return ( current_weights )
}

# train on a portion of our data
weights <- train_weights_on_perceptron(clusterdata[1:25,], target[1:25], 0.001, 50)
for( ii in 1:nrow(clusterdata) ) {
    prediction <- predict_cluster(clusterdata[ii,], weights)
    print(paste("Expected", target[ii], "Predicted",prediction + 1))
}

x <- seq(-8,8,by=0.1)
y <- seq(-8,8,by=0.1)
z <- weights[1] * x + weights[2] * y 
lines(x,z,col="blue", lwd=3)

# Here we have effectively compressed our
# 100 points of data to 2 values. Pretty cool!

# Q: Why is a function better than giving the raw data?
# If Alice is teaching Bob what is a cat and what is a dog.
# Alice tells Bob every instance of cat and dog she has seen in her life.
# Bob goes to the park and sees an animal. He checks on his list from Alice.
# This animal is not on Alice's list.  Bob does not know if the animal is a dog or cat.
# A better way is if Alice told Bob that a cat says "meow" and a dog says "woof".
# Now Bob can classify any NEW animal, not just the ones Alice has seen before.
# This is equivalent to Alice giving Bob the weights of her model rather than 
# the original input and output data.


