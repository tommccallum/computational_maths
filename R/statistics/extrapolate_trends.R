x <- 1:10
y <- rnorm(10)


# Linear extrapolation
# we extend our line via prediction (see prediction example).

# Linear interpolation
# we find a value between two values in our line.
# This example is from the R documentation.
# Other common ones are bezier curves for graphics.
# Note that this creates a line between each given point.
par(mfrow = c(2,1))
plot(x, y, main = "approx(.) and approxfun(.)")
points(approx(x, y), col = "red", pch = "*")
points(approx(x, y, method = "constant"), col = "blue", pch = "*")

# approxfun gives us a function we can plug x values into to 
# generate new values.
f <- approxfun(x, y)
curve(f(x), 0, 10, col = "green")
points(x, y)
is.function(fc <- approxfun(x, y, method = "const")) # TRUE
curve(fc(x), 0, 10, col = "darkblue", add = TRUE)
