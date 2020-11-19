# Moving from the equation of a line to linear combination of factors.

#
# Remember our equation of a line.
# y = mx + c
# We can rearrange this as y - mx = c
# note we can rewrite this as 
# y + mx = c (the minus sign got absorbed into the definition of our gradient and constant 'c' when we multiply through by -1)
#
# Up to now we have thought of y as our output and x as output input.
# We can however think of y as some other input.
# So we rewrite this as:
#   ax1 + bx2 = c
# 'c' here is the y_intercept, which is some constant value, but its also known as the bias.
#
# Now we have it in this form you can see we can now add more x's to it:
#   a1x1 + a2x2 + a3x3 + .... = c
# All the a's are some value between 0 and 1. 
#
# Observe that this is similar to the dot product 
# between some vector (a1,a2,a3,...) and (x1,x2,x3,...).
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

## ----------------------
## Dot Product
## ----------------------

par(mfrow=c(1,2))
plot(-10:10,-10:10, col="white", main="linear dependence")
abline(v=0)
abline(h=0)

lines(c(0,5),c(0,5), col="black")
points(5,5,pch=19,col="red", lwd=5)

lines(c(0,7),c(0,7), col="black")
points(7,7,pch=19,col="blue", lwd=5)

text(1,-1, "Note: the angle between the red and green line (aka vector) is zero.")

plot(-10:10,-10:10, col="white", main="linear dependence")
abline(v=0)
abline(h=0)

lines(c(0,5),c(0,5), col="black")
points(5,5,pch=19,col="red", lwd=5)

lines(c(0,3),c(0,7), col="black")
points(3,7,pch=19,col="blue", lwd=5)

text(1,-1, "Note: the angle between the red and green line (aka vector) is not zero.")

