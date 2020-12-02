library(datasets)
data(iris)
independent <- iris$Sepal.Length
dependent <- iris$Petal.Length

# we are going to fit a line to our sepal length data
plot(independent,dependent, main="Fitting linear model to Sepal Length", ylim=c(0,max(d)))
abline(v=0)
abline(h=0)
# this one includes y-axis at the origin
abline(lsfit(independent,dependent), col="green", lwd=3)
abline(lsfit(independent,dependent, intercept=FALSE), col="red", lwd=3)

# we might be interested in the distribution of the
# errors about the line of best fit
hist(lsfit(independent,dependent)$residuals)

