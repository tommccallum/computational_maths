# Moving from the equation of a line to linear combination of factors.

#
# Remember our equation of a line.
# y = mx + c
# We can rearrange this as y - mx + c = 0
# note we can rewrite this as 
# y + mx + c = 0 (the minus sign got absorbed into the definition of our gradient 'm')
#
# Up to now we have thought of y as our output and x as output input.
# We can however think of y as some other input.
# So we rewrite this as:
#   ax1 + bx2 + c = 0
# 'c' here is the y_intercept, which is some constant value, but its also known as the bias.
#
# Now we have it in this form you can see we can now add more x's to it:
#   a1x1 + a2x2 + a3x3 + .... + c = 0
# All the a's are some value between 0 and 1. 
#
# This is the same as the dot product.
#

index <- -10:10
x1 <- -10:10
x2 <- -10:10

plot(x1,x2, ylim=c(-20,20), xlim=c(-20,20), col="white", xlab="index", ylab="ax1+bx2", main="a linear combination of factors can represent any line (except vertical)")
abline(v=0)
abline(h=0)
points1 <- runif(21, min=-10, max=10)
points(index, points1, pch=19)

# know we add some "weights" to each
w1 <- 0.5
w2 <- 1
lines(index, w1 * x1 + w2 * x2, col="orange")

w1 <- 1
w2 <- 1
lines(index, w1 * x1 + w2 * x2, col="red")

w1 <- 0
w2 <- 1
lines(index, w1 * x1 + w2 * x2, col="blue")

w1 <- -1
w2 <- 1
lines(index, w1 * x1 + w2 * x2, col="green", lwd=3)

w1 <- -1
w2 <- 0
lines(index, w1 * x1 + w2 * x2, col="pink", lwd=1)

# note that a vertical line is impossible 
# Q: what is the gradient of a vertical line?
# Hint: this back to the formula of a gradient, what is the denominator?

