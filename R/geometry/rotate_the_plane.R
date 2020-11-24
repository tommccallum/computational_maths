plot(-10:10,-10:10, col="white", main="Rotate rectangle")
abline(v=0)
abline(h=0)
# left (x), bottom (y), right (x), top (y)
xx <- c(2,-2,-2,2,2)
yy <- c(2,2,-2,-2,2)
polygon(xx,yy,border="blue", col="blue")

# rotation of pi/2 radians
rotate <- function(x,y, radians=pi/4) {
    # how did we come up with these formulas?
    x_new <- x * cos(radians) - y * sin(radians)
    y_new <- x * sin(radians) + y * cos(radians)
    return ( cbind(x_new,y_new) )
}

# rotate 45 degrees
m <- rotate(xx,yy)
polygon(m[,1],m[,2],border="red", col="red")

# reflect in y-axis
n_yy <- yy * -1
polygon(xx,n_yy,border="green", col="green")

# reflect in x-axis
n_xx <- xx * -1
polygon(n_xx,yy,border="yellow", col="yellow")
