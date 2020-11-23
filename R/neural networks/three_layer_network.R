# Inspired by https://ljvmiranda921.github.io/notebook/2017/02/17/artificial-neural-networks/
source("activation_functions.R")
source("relu.R")
source("loss_functions.R")

library(datasets)
data(iris)

input_nodes_in_layer_1 <- 4
hidden_nodes_in_layer_2 <- 6 # change this from 3 to 6, what happens?
output_nodes_in_layer_3 <- 3
num_training_samples <- 100
num_test_data <- 50

# set.seed(100)
# # rows = node count, cols = samples
# training_input_data <- matrix(runif(num_training_samples*input_nodes_in_layer_1), nrow=input_nodes_in_layer_1)
# training_target_data <- sample(0:2,num_training_samples,replace=TRUE)
# other <- 1 - training_target_data
# training_target_data <- rbind(training_target_data, other)
# row.names(training_target_data) <- 1:nrow(training_target_data)

# testing_input_data <- runif(num_test_data)
# testing_target_data <- sample(0:2,num_test_data,replace=TRUE)
# other <- 1 - testing_target_data
# testing_target_data <- rbind(testing_target_data, other)
# row.names(testing_target_data) <- 1:nrow(testing_target_data)

random_iris_index <- sample(1:150, 150, replace=F)
random_iris <- iris[random_iris_index,]

training_data <- random_iris[1:num_training_samples,]
# @TODO note to rescale to 0.05-0.95 of range to allow for outsized new data
heights <- apply(training_data[,1:4], MARGIN=2, max)
training_input_data <- t(t(t(training_data[,1:4]) / heights))
training_target_data <- matrix(0, ncol=num_training_samples, nrow=3)
training_targets <- random_iris[1:num_training_samples,5]
training_target_data[1,which(random_iris[1:num_training_samples,5]=="setosa")] <- 1
training_target_data[2,which(random_iris[1:num_training_samples,5]=="versicolor")] <- 1
training_target_data[3,which(random_iris[1:num_training_samples,5]=="virginica")] <- 1

test_heights <- apply(random_iris[101:150,1:4], MARGIN=2, max)
testing_input_data <- t(t(t(random_iris[101:150,1:4])/test_heights))
testing_target_data <- matrix(0, ncol=num_test_data, nrow=3)
testing_targets <- random_iris[101:150,5]
testing_target_data[1,which(random_iris[101:150,5]=="setosa")] <- 1
testing_target_data[2,which(random_iris[101:150,5]=="versicolor")] <- 1
testing_target_data[3,which(random_iris[101:150,5]=="virginica")] <- 1


# we are assuming a fully connected model, that is each node in a layer is
# connected to all nodes in the next layer
# each node has a activation function
# in the middle layer it is ReLU
# in the output layer we have a softmax
# we ignore biases as we want the weights to carry that information.

predict <- function( layer_1_weights, layer_2_weights, data ) {
    predictions <- NULL
    for( ii in 1:ncol(data) ) {
        A0 <- data[,ii]
        z1 <- A0 %*% t(layer_1_weights) # 1 x 15
        # in the layer 2 node we calculate the activation 
        A1 <- rectified_linear_function(z1)
        A1 <- as.matrix(A1, nrows=1)

        # preactivation - this happens in layer 3 which combines the output from 
        # layer 2 and the weights joining layer 2 and 3.
        z2 <- layer_2_weights %*% A1 # 2 x 1
        # activation that occurs in layer 3
        A2 <- logistic_sigmoid_function(z2) 
        
        selected <- which.max(A2)
        predictions <- c( predictions, selected )
    }
    return (predictions)
}

train_on_data <- function( input_data, target_data, num_epochs = 5000, learning_rate=0.08 ) {
    layer_1_weights <- matrix(runif(input_nodes_in_layer_1*hidden_nodes_in_layer_2), nrow=hidden_nodes_in_layer_2)
    layer_1_bias <- matrix(0, nrow=nrow(layer_1_weights))
    layer_2_weights <- matrix(runif(hidden_nodes_in_layer_2*output_nodes_in_layer_3), nrow=output_nodes_in_layer_3)
    layer_2_bias <- matrix(0, nrow=nrow(layer_2_weights))

    # CHECK: these matrices should have the number of rows as the number of samples
    #           the number of columns should be the number of NODES in each layer
    epoch_errors <- NULL
    for( epoch in 1:num_epochs ) {
        sum_error <- 0
        for( ii in 1:ncol(input_data) ) {
            input_row_of_data <- input_data[,ii]
            target_row_of_data <- target_data[,ii]

            # print("Feed forward")
            A0 <- input_row_of_data

            # forward pass of our network
            # First the data moves into the first node and we do the linear combination
            # pre-activation
            # takes the output of first layer (inputs) and combines them with weights
            # which join layer 1 to layer 2.
            z1 <- as.vector((A0 %*% t(layer_1_weights))) + layer_1_bias# 1 x 15
            # in the layer 2 node we calculate the activation 
            A1 <- rectified_linear_function(z1)
            A1 <- as.matrix(A1, nrow=1)
            # print(A1)

            # preactivation - this happens in layer 3 which combines the output from 
            # layer 2 and the weights joining layer 2 and 3.
            z2 <- as.vector((layer_2_weights %*% A1)) + layer_2_bias # 2 x 1
            # print(z2)
            # activation that occurs in layer 3
            A2 <- logistic_sigmoid_function(z2) 
            # print(A2)

            ## level of indirection so we can try different loss functions
            calculate_loss <- function(estimates, actual) {
                #return ( cross_entropy_loss_function(estimates, actual) )
                return ( quadratic_loss_function(estimates, actual) )
            }

            # we compute the loss function - how wrong we are with this example
            # loss can also be called error.
            # https://en.wikipedia.org/wiki/Backpropagation#Finding_the_derivative_of_the_error
            loss_per_sample <- calculate_loss(A2, target_row_of_data)
            avg_loss_per_sample <- sum(loss_per_sample) / num_training_samples
            sum_error  <- sum_error + avg_loss_per_sample

            # now we have our error we need to backprogagate these errors
            # to our first and second layer weights

            # Back-propagation makes use of the chain rule in calculus to find out to 
            # what degree changes to the different parameters of our network influence 
            # its final loss value.
            # Ref: https://towardsdatascience.com/coding-a-2-layer-neural-network-from-scratch-in-python-4dd022d19fd2

            # print("backpropagation")
            Yh <- A2
            # print(target_row_of_data)
            # print(Yh)
            #Yh <- pmin(Yh,1)
            # print(Yh)
            #dLoss_Yh <- derivative_cross_entropy_loss_function(as.vector(Yh), as.vector(target_row_of_data))
            dLoss_Yh <- derivative_quadratic_loss_function(as.vector(Yh), as.vector(target_row_of_data))
            # print(dLoss_Yh)
            dLoss_Z2 <- dLoss_Yh * derivative_logistic_sigmoid_function(z2)
            # print(dLoss_Z2)

            dLoss_A1 <- t(layer_2_weights) %*% dLoss_Z2
            # print(dLoss_A1)
            dLoss_W2 <- 1 / ncol(A1) * ( dLoss_Z2 %*% t(A1))
            # print("weights layer 2 delta")
            # print(dLoss_W2)
            dLoss_b2 <- 1 / ncol(A1) * dLoss_Z2 

            dA1_Z1 <- derivative_relu(z1) # z1 is 5
            dLoss_Z1 <- dLoss_A1 * dA1_Z1
            # print(dLoss_Z1)

            dLoss_W1 <- dLoss_Z1 %*% t(A0)
            dLoss_W1 <- 1 / length(A0) * dLoss_W1
            # print("weights layer 1 delta")
            # print(dLoss_W1)
            dLoss_b1 <- 1 / length(A0) * ( dLoss_Z1  )
            # print(dLoss_b1)
            
            if ( any(is.nan(dLoss_W1)) ) {
                stop("now")
            }


            # update our weights
            # if the derivative is negative, then it means increasing weights will reduce our cost
            layer_1_weights <- layer_1_weights - (learning_rate * dLoss_W1)
            layer_1_weights[which(layer_1_weights < -1)] <- -1
            layer_1_weights[which(layer_1_weights > 1)] <- 1
            layer_1_bias <- 0 #layer_1_bias - (learning_rate * dLoss_b1)
            layer_2_weights <- layer_2_weights - (learning_rate * dLoss_W2)
            layer_2_weights[which(layer_2_weights < -1)] <- -1
            layer_2_weights[which(layer_2_weights > 1)] <- 1
            layer_2_bias <- 0 # layer_2_bias - (learning_rate * dLoss_b2)

            if ( all(abs(layer_1_weights) == 1)) {
                print(layer_1_weights)
                stop("all ones")
            }

            # print(layer_1_weights)
            # print(layer_1_bias)
            # print(layer_2_weights)
            # print(layer_2_bias)
        }
        if ( epoch %% 100 == 0 ) {
            print(paste("[", epoch, "] Error: ", sum_error, sep=""))
        }
        epoch_errors <- c( epoch_errors, sum_error )
    }
    plot(epoch_errors, type="l", main="Error per Epoch")
    items <- list( "layer1" = layer_1_weights, "layer2" = layer_2_weights )
    return ( items )
}

result <- train_on_data(training_input_data, training_target_data)
print(result)
predictions <- predict( result[["layer1"]], result[["layer2"]], training_input_data )
print(table(predictions == as.integer(training_targets))/length(training_targets))
predictions <- predict( result[["layer1"]], result[["layer2"]], testing_input_data )
print(table(predictions == as.integer(testing_targets) )/length(testing_targets))

