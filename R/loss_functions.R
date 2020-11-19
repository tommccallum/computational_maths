# also known as MSE, mean squared error
quadratic_loss_function <- function(estimates, actual) {
    return ( (estimates - actual)^2 )
}

derivative_quadratic_loss_function <- function(estimates, actual) {
    return ( 1/2 * (estimates - actual) )
}

# cross entropy
# https://ml-cheatsheet.readthedocs.io/en/latest/loss_functions.html
cross_entropy_loss_function <- function(estimates, actual) {
    # fudge to stop 0 from blowing us up.
    wPos <- which(actual == 1 )
    wNeg <- which(actual != 1 )
    actual[which(actual == 0)] <- 0.00001
    estimates[which(estimates == 0)] <- 0.00001
    actual[which(actual == 1)] <- 0.99999
    estimates[which(estimates == 1)] <- 0.99999

    result <- rep(0,length(actual))
    result[wPos] <- -log(estimates[wPos])
    result[wNeg] <- -log(1-estimates[wNeg])
    return ( result )
}

derivative_cross_entropy_loss_function <- function(estimates, actual) {
    a <- - (actual / estimates)
    b <- (1-actual) / (1-estimates)
    return ( -1 * (a - b) )
}

