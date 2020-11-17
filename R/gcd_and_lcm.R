# Greatest common devisor
gcd <- function(x, y) {
    greatest_common_divisor <- NA
    smaller_value <- min(x,y)
    for(a_value in 1:smaller_value) {
        # if x is divisible by i
        # OR if y is divisible by i
        if( (x %% a_value == 0) && (y %% a_value == 0)) {
            greatest_common_divisor = a_value
        }
    }
    return(greatest_common_divisor)
}

gcd(4,2)
gcd(100,10)

# Euclids version
euclid_gcd <- function(x, y) {
    while(y) {
        temp = y
        y = x %% y      # is x divisible by y, set y as the remainder
        x = temp
    }
    return(x)
}

euclid_gcd(4,2)
euclid_gcd(100,10)

# Least common multiple
lcm <- function(x, y) {
    # choose the greater number
    greater_value <- max(x,y)
    least_common_multiple <- NA
    while(TRUE) {
        # is the larger value divisible by x and y
        if((greater_value %% x == 0) && (greater_value %% y == 0)) {
            least_common_multiple = greater_value
            break
        }
        # if not increase
        greater_value = greater_value + 1
    }
    return(least_common_multiple)
}

lcm(2,4)

# makes use of the relationship 
#  x * y = gcd(x,y) * lcm(x,y)
faster_lcm <- function(x,y) {
    return ((x * y) / euclid_gcd(x,y))
}

faster_lcm(2,4)