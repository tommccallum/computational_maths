# Reference: https://ocw.mit.edu/courses/mathematics/18-05-introduction-to-probability-and-statistics-spring-2014/readings/MIT18_05S14_Reading6b.pdf

# When does it apply?
# - independent samples from the same distribution

# density
d <- dnorm(seq(-3,3,by=0.1), mean=0, sd=1)
# distribution function
p <- pnorm(seq(-3,3,by=0.1), mean=0, sd=1)
# quantile function
q <- qnorm(seq(0.0001,0.99,by=0.1), mean=0, sd=1)
# random generation of samples
r1 <- rnorm(10,mean=0, sd=1)
r2 <- rnorm(1000,mean=0, sd=1)

par(mfcol=c(3,2))
plot(r2, main="Samples from a Normal distribution")
points(r1, col="red", bg="red", pch=21)
plot(density(r1), main="Normal distribution samples (10)", ylim=c(0,1), col="black")
abline(v=q, col="orange")
plot(density(r2), col="green", lwd=3, main="Normal distribution samples (1000)")
abline(v=q, col="orange")
plot(seq(-3,3,by=0.1), d, col="red", main="Density (dnorm) output of a normal distribution N(0,1)", type="l")
plot(seq(-3,3,by=0.1), p, col="blue", main="Distribution function (pnorm) of a normal distribution N(0,1)", type="l")
abline(v=q, col="orange")   # these are the quantiles
plot(1:10, main="none")
par(mfcol=c(1,1))


#
# Law of large numbers tells us 2 useful things:
#   1. the mean of the independent samples is with probability close to 1 (high) close to the mean of the underlying distribution
#   2. the density histogram of many independent samples is, with probability close to 1, close to the density histogram of the underlying distribution
#

# Lets choose a coin which has a Bernoulli (binomial) random variable.
# This applies to events with 2 outcomes e.g. coin flip
# The average chance of a head P(Head) = 0.5 P(Tail) = 0.5
#
# pbinom gives the probability distribution of a binomial random variable
# its arguments are:
#   q - quantile
#   size - samples
#   prob - mean

# Q: Pr(0.4 <= X <= 0.6), where X is the proporition of heads in n flips
# Expect that as n (num_flips) gets larger X will get closer to 0.5 (we say that X tends to 0.5)
# Below we work out the probability of X being within 0.1 of the true mean (0.5)
num_flips <- 10
lowerbound <- (0.4 * num_flips) - 1             # the -1 is because its <= instead of <
upperbound <- 0.6 * num_flips
prob_of_head <- 0.5
print(paste("n =",num_flips,": proportion of heads in n flips: ", pbinom(upperbound, num_flips, prob_of_head) - pbinom(lowerbound, num_flips, prob_of_head)))

num_flips <- 1000
lowerbound <- (0.4 * num_flips) - 1             # the -1 is because its <= instead of <
upperbound <- 0.6 * num_flips
prob_of_head <- 0.5
print(paste("n =",num_flips,": proportion of heads in n flips: ", pbinom(upperbound, num_flips, prob_of_head) - pbinom(lowerbound, num_flips, prob_of_head)))

# This demonstrates that by the law of large numbers the probability goes to 1 as n (num_flips) grows.


#
# The central limit theorem (CLT) says:
# the SUM or MEAN of many independent samples of a random variable is approximately a normal random variable.
# the CLT gives precise values for the mean and standard deviation of the random variable.
#
# A random variable is some process that we are measuring, e.g. height or weight
# Does not apply to a coin flip as this has only 2 values and is not a "continuous" measurement.
#
# We need a minimum of 30 samples for the CLT to apply.

library(datasets)
data(iris)
iris_data <- iris[["Sepal_Length"]]          # generating independent samples from a normal random variable
mean(iris_data)     # ~ 6
sd(iris_data)       # ~ 1

synthetic <- rnorm(10000, mean=5.8, sd=0.82)
mean(synthetic)
sd(synthetic)

par(mfcol=c(2,1))
plot(density(iris_data), main="Sepal length (random variable)")
plot(density(synthetic), main="Synthetic Sepal length (random variable)")

# we can test the "normality" of our data by using a Goodness-of-fit test
shapiro_test(iris_data)
# we look at the p-value and this gives us our confidence (p-value = 0.01, means a 1 in a 100 chance of being a false positive)
# given an alpha level of 0.05, if the p-value < alpha, then we can reject the null hypothesis (that the data is normally distributed) and 
# there is evidence that the data IS NOT normally distributed.

# Why does this test say that the IRIS data is not normally distributed for Sepal and Petal sizes?

# Measurements can be effected by systematic error and sampling bias - this is different to random errors that can be controlled by adding more data.
# Systematic error - errors caused due to the means of measuring
# Sampling Bias - errors caused by the way how the sample is selected from the population



# Why do we need to know this? Many cases in data science comes down to using the normal distribution because we ASSUME that the 
# data is independent.
# Q: Can we test data to see if its independent or not?
# Answer: Yes we can.  We can use tets such as chi-square
