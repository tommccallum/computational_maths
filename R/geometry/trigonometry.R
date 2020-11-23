# The humble triangle

area_of_triangle <- function( base, height ) {
    return (0.5 * base * height)
}

area_of_triangle(4,5) # 10

hypotheneuse_of_a_right_angled_triangle <- function(adjacent, opposite) {
    return (sqrt( adjacent ^ 2 + opposite ^ 2 ))
}

hypotheneuse_of_a_right_angled_triangle(3,4) # 5

# give a unit circle
# we can start to define some important triables
# SOHCAHTOA
#   sin(theta) = opp/hyp
#   cos(theta) = adj/hyp
#   tan(theta) = opp/adj

angle <- seq(-pi,pi,0.01)
x <- 1 * cos(angle)
y <- 1 * sin(angle)
plot(x,y, type="l", xlim=c(-1.5,1.5), ylim=c(-1.5,1.5))
abline(h=0)
abline(v=0)
angle <- pi/6 # 45 degrees
point_on_circle_perimeter_x <- 1 * cos(angle)
point_on_circle_perimeter_y <- 1 * sin(angle)
lines(c(0,point_on_circle_perimeter_x),c(0,point_on_circle_perimeter_y))
lines(c(point_on_circle_perimeter_x,point_on_circle_perimeter_x),c(0,point_on_circle_perimeter_y))
points(point_on_circle_perimeter_x,point_on_circle_perimeter_y,pch=21, bg="red", col="red")
# the innermost angle we call theta and the upper angle we call phi
text(0.2,0.05,expression(theta))
text(point_on_circle_perimeter_x-0.05,point_on_circle_perimeter_y-0.1,expression(phi))

# note the following relationship:
# pi/2 + theta + phi = pi
# theta + phi = pi/2

text(point_on_circle_perimeter_x,-0.1,"x")
text(point_on_circle_perimeter_x,point_on_circle_perimeter_y+0.1,"y")

text(point_on_circle_perimeter_x+0.18,point_on_circle_perimeter_y/2,parse(text=paste("h * sin(theta)")))
text(point_on_circle_perimeter_x/2,-0.06,parse(text=paste("h * cos(theta)")))

text(-1.0,1.5,parse(text=paste("r^2 == (cos(theta))^2 + (sin(theta))^2")))
text(-1.0,1.4,parse(text=paste("h^2 == a^2 + b^2")))

center_of_circle_x <- 0
center_of_circle_y <- 0
gradient_of_radius_at_xy <- (point_on_circle_perimeter_y - center_of_circle_y) / (point_on_circle_perimeter_x - center_of_circle_x)
# gradient of the tangent is 90 degrees to or perpendicular to the gradient of the radius at xy
gradient_of_tangent = -1 * ( 1 / gradient_of_radius_at_xy )
# find intercept by using 
# equation for a line ( y = mx + c )
# and putting a point in for y and x and gradient for m
y_intercept <- point_on_circle_perimeter_y - (gradient_of_tangent * point_on_circle_perimeter_x)

# draw tangent
x <- seq(-1.5,1.5,seq=0.01)
lines(x, x * gradient_of_tangent + y_intercept)
text(point_on_circle_perimeter_x-0.1,point_on_circle_perimeter_y+0.5, "tangent")

# inverse cos, sin, tan are called arccos, arcsin, arctan or acos,asin,atan
# these tranform a ratio to an angle


# NOTE: that a point on the perimeter of the circle can be represented
# in 2 ways.
# CARTESIAN COORDINATES:    (x,y)
# POLAR COORDINATES:        (theta, radius)

polar_coordinates <- function( cartesian_x, cartesian_y ) {
    # using pythagoras' rule
    radius <- sqrt( cartesian_x ^ 2 + cartesian_y ^ 2)
    # using TOA from SOHCAHTOA
    # atan is the inverse of tan
    angle <- atan(cartesian_y/cartesian_x)
    polar_coords <- c(radius, angle)
    return (polar_coords)
}

catesian_coordinates <- function( polar_radius, polar_theta ) {
    # to get our (x,y) coordinates we can use SOH and CAH
    # from SOHCAHTOA, remember the radius is the H in SOHCAHTOA
    x <- polar_radius * cos(polar_theta)
    y <- polar_radius * sin(polar_theta)
    cartesian_coords <- c(x,y)
    return (cartesian_coords)
}

# Try and see with some points and see what you get!
