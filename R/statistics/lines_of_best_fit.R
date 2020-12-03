library(datasets)
data(iris)
independent <- iris$Sepal.Length
dependent <- iris$Petal.Length

# we are going to fit a line to our sepal length data
plot(independent,dependent, main="Fitting linear model to Sepal Length", ylim=c(0,max(d)))
abline(v=0)
abline(h=0)
# this one includes y-axis at the origin
# here we can change the m and c in our line equations
# y=mx+c, so has 2 degrees of freedom
abline(lsfit(independent,dependent), col="green", lwd=3)
# here we can change only the m as c=0, so we have 
# 1 degree of freedom.
abline(lsfit(independent,dependent, intercept=FALSE), col="red", lwd=3)

# we might be interested in the distribution of the
# errors about the line of best fit
hist(lsfit(independent,dependent)$residuals)

