# numbers drawn from a uniform distribution between 0 and 1
uniform_distribution <- runif(1000, 0, 1)
plot(uniform_distribution)

# numbers drawn from a normal distribution between 0 and 1
normal_distribution <- rnorm(1000, 0, 1)
plot(normal_distribution)

# check the histogram of our uniform
par(mfcol=c(2,2))
hist(uniform_distribution)
hist(normal_distribution)
plot(density(uniform_distribution))
plot(density(normal_distribution))

par(mfcol=c(1,1))




