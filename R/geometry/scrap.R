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
text(0.2,0.05,expression(phi))
