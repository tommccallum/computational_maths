# Here we have some number classes

# define the variable 'a' to be 1,2,3,...,10
a <- 1:10                               # short form
a <- c(1,2,3,4,5,6,7,8,9,10)            # long form

# define the variable 'b' to be 1,2,3,...,10
b <- seq(1,10)                          # an alternative form


# u is a rational number and can be exactly represented as a power of two.
u <- 1/2

# 1/3 is a rational number, but is a infinite recurring decimal
u <- 1/3

# pi is an irrational number, which means it cannot be expressed as a fraction
# however when we view the value "pi" in R, we get 6 decimal places.
# there are no irrational numbers due to computers not having infinite precision.
# we can extend the number of bits that represent our value of pi to get ever more 
# precise
w <- pi

# is 0.9999999999 == 1
0.999999999999999 == 1                  # FALSE
all.equal(0.99999999999, 1)             # TRUE

# floating point values should always be compared as a range not as an exact value.
# all.equal compares the value up to 8 decimal places by default.
all.equal(0.9999999, 1)                 # has a difference
all.equal(0.99999999, 1)                # is the same

# complex numbers are easily handled, z is a common variable used for complex numbers
z <- 1 + 2i
Re(z)
Im(z)

