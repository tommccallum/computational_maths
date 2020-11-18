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
whichCluster=sample(1:2,100,replace=TRUE)
# take mean of each cluster
clusterMeans=matrix(rnorm(3*2,sd=4),3,2)
clusterdata=sampleData+clusterMeans[whichCluster,]
clusterdata[which(whichCluster==1)]=clusterdata[which(whichCluster==1)]+5
clusterdata[which(whichCluster==1),2]=clusterdata[which(whichCluster==1),2]+5
plot(clusterdata,col=whichCluster,pch=19, ylim=c(-8,8), xlim=c(-8,8))
points(clusterdata, col=whichCluster, type="p", pch=19)

# Function that does our prediction for us based 
# on our linear expression
predict_cluster <- function(row, weights, bias=0) {
    # this is where we calculate the linear combination
    activation <- sum(weights * row) + bias
    # this is our decision making mechanism
    # we can transform this activation with a sigmoid or a threshold
    # function or anything else...
    if ( activation >= 0 ) {
        return (1.0)
    } else {
        return (0.0)
    }
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
            y <- current_weights[1] * x + current_weights[2]
            lines(x,y,col="orange", lwd=3, lty=2)

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
weights <- train_weights_on_perceptron(clusterdata[1:25,], whichCluster[1:25], 0.001, 50)
for( ii in 1:nrow(clusterdata) ) {
    prediction <- predict_cluster(clusterdata[ii,], weights)
    print(paste("Expected", whichCluster[ii], "Predicted",prediction + 1))
}

x <- seq(-8,8,by=0.1)
y <- weights[1] * x + weights[2]
lines(x,y,col="blue", lwd=3)


# if a point is on the x axis at y=0
# then the linear combination will be a * x_1 + b * x_2 = output
# if a point is on the y axis at x=0


