default_function <- function(x) {
    if ( x >= 0.0 )  {
        return ( 1.0 )
    } else {
        return ( 0.0 )
    }
}

logistic_sigmoid_function <- function(x, gradient_of_slope=1, bias=0) {
    return ( 1 / (1 + e^(-(x+bias)*gradient_of_slope)) )
}

derivative_logistic_sigmoid_function <- function(x) {
    s <- logistic_sigmoid_function(x)
    dS <- s * ( 1 - s )
    return (dS) 
}

hyperbolic_tangent_sigmoid_function <- function(x) {
    return (tanh(x))
}

# ReLU
# https://machinelearningmastery.com/rectified-linear-activation-function-for-deep-learning-neural-networks/
rectified_linear_function <- function(x) {
    return ( pmax(rep(0,length(x)),x) )
}

# note that when we cannot calculate the gradient due to it being non-continuous,
# we _assume_ its 0 without any ill-harm
derivative_relu <- function(x) {
    y <- x
    y[which(x <= 0)] <- 0
    y[which(x > 0)] <- 1
    return (y)
}

# Softmax function
# https://en.wikipedia.org/wiki/Softmax_function
softmax_function <- function(x) {
    return ( e^x / sum(e^x) )
}

