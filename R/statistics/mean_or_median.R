# When to use median and when to use mean?
#
# What is the question we are trying to answer?
#       - What is the value that best represents the central point of this mass of numbers?

# What is the mean?
my_mean <- function(x) {
    return ( sum(x) / length(x) )
}

# What is the median?
my_median <- function(x) {
    x <- sort(x)
    n <- length(x)
    if ( n %% 2 == 0 ) {
        return ( mean(c(x[n/2], x[n/2+1])) )
    } else {
        return ( x[floor(n/2)] )
    }
}

# our data
rn <- runif(100,100,200)
data <- c(1,rn,300)
m1 <- my_mean(data)
med1 <- my_median(data)
m2 <- my_mean(rn)
print(paste("Mean:",m1))
print(paste("Median:",med1))
print(paste("Mean, without outliers:",m2))

# when we have outliers the median is the better measure of center of the mass
# when we do not the mean is the better value
par(mfcol=c(2,1))
plot(data)
hist(data)
par(mfcol=c(1,1))