# The sigmoid is a SET of functions that have an S shape.
# The common one is a logistic function.
e <- exp(1)

# here we can change the shape of the sigmoid but having some well placed
# parameters that squish and move the line of transition
logistic_sigmoid_function <- function(x, gradient_of_slope=1, bias=1) {
    return ( 1 / (1 + e^(-(x+bias)*gradient_of_slope)) )
}

par(mfcol=c(2,1))
x <- seq(-6,6,0.01)
y <- logistic_sigmoid_function(x)
plot(x, y, ylim=c(0,1), xlim=c(-6,6), main="logistic sigmoid", type="l")
abline(v=0)

hyperbolic_tangent_sigmoid_function <- function(x) {
    return (tanh(x))
}

x <- seq(-6,6,0.01)
y <- hyperbolic_tangent_sigmoid_function(x)
plot(x, y, ylim=c(-1,1), xlim=c(-6,6), main="hyperbolic tangent sigmoid", type="l")
abline(v=0)
abline(h=0)

par(mfcol=c(1,1))

# WHY are these functions used?
# Answer: they are differentiable (you can take the gradient of them easily)
#         they are bounded on the y-axis between 0 and 1
#         they have 1 point of inflection, 
#           i.e. 1 point where the tangent of the curve goes from being below the curve to above.
#

# The animation of this is at https://en.wikipedia.org/wiki/Inflection_point
par(mfcol=c(2,1))
angle <- seq(-pi/4, 5*pi/4, 0.01)
curve <- sin(2*angle)
plot(curve, main="sin(2x)", type="l")
abline(h=0)
differentiated_fn <- -4*sin(2*angle)
plot(differentiated_fn, main="-4sin(2x)", type="l")
abline(h=0)
par(mfcol=c(1,1))

# lets have a look at the derivative of the logistic function
par(mfcol=c(2,1))
x <- seq(-6,6,0.01)
y <- logistic_sigmoid_function(x)
plot(x, y, ylim=c(0,1), xlim=c(-6,6), main="logistic sigmoid", type="l")
abline(v=0)

derivative_logistic_sigmoid_function <- function(x) {
    return ( e^x / ( 1 + e^x)^2 )
}

x <- seq(-6,6,0.01)
y <- derivative_logistic_sigmoid_function(x)
plot(x, y, ylim=c(0,1), xlim=c(-6,6), main="derivative of logistic sigmoid", type="l")
abline(v=0)
par(mfcol=c(1,1))

