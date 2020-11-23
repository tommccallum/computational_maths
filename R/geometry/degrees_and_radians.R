# Area of a circle is
r <- 1      # this is called the UNIT circle (any value of magnitude 1 tends to get the word UNIT attached to it, e.g. unit vector)
area_of_circle <- pi * r * r
perimeter <- 2 * pi * r 
# pi is the ratio of the circumference to its diameter
# it is an irrational number.

# plotting a circle 
# (you can use the circles package to draw circles of course)
angle <- seq(-pi,pi,0.01)
x <- 1 * cos(angle)
y <- 1 * sin(angle)
plot(x,y, type="l")

#
# degrees to radians
# The perimeter of a circle is 2*pi*r, where we take r = 1
# In school we learnt there are 360 degrees in a circle.
# To convert from degrees to radians we can do:
#
#   2 * pi * 1 radians = 360 * 1 degree
#   pi * 1 radians = 180 * 1 degree
#   1 degree = pi / 180 * 1 radians
#
# e.g.  90 degrees = ( pi / 180 ) * 90 = pi / 2 radians
#       pi radians = ( 180 / pi ) * pi = 180 degrees
#
degrees_to_radians <- function( degrees ) {
    return ( (degrees * (pi / 180)) %% (2*pi) )
}

radians_to_degrees <- function( radians ) {
    return ( (radians * (180 / pi)) %% 360 )
}
