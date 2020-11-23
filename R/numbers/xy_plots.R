# reinforce that multiplying by a negative is a rotation.
x <- -10:10
y <- x

plot(y~x, type="l", main="y~x and y~-x")

# rotate a line on a place by 180 degrees
y <- -x
lines(y~-x, col="orange")

# solving for an equation
# 25 = x + 2
# break this into 2 equations
# y = 25
# w = x + 2
# find where y = w
x <- -30:30
y <- rep(25,length(x))

plot(x, x+2, type="l")
lines(x, y, col="orange")
