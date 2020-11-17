# y = 1 * x + 2
# y = (1*)x (+0)
# gradient == slope of our line
# y_intercept == where the line will touch our y axis
eqn <- function(x, gradient=1, y_intercept=2) {
    y <- gradient * x + y_intercept
    return ( y )
}

# what is the gradient of the line
# (0,2) (1,3) 
find_gradient <- function(x1=0,y1=2,x2=1,y2=3) {
    change_in_x <- x2 - x1
    change_in_y <- y2 - y1
    return ( change_in_y / change_in_x)
}

find_y_intercept <- function(x,y,gradient) {
    y_intercept <- y - (gradient * x)
    return (y_intercept)
}

# here is some code to plot and calculate using these functions
x <- 1:20
plot(eqn(x,1,2), type="l") # plot our equation
# take 2 points on the line (any order)
# (0,2), (1,3)
# Q: do we need to know the y_intercept to calculate the gradient?
gradient <- find_gradient(0,2,1,3)
print(paste("Gradient: ",gradient))
# Q: do we need to know the gradient to calculate the Y intercept?
print(paste("Y-Intercept: ",find_y_intercept(0,2,gradient)))
