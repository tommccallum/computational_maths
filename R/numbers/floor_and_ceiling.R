# take the floor of a number using the function 'floor'
# Math.floor in javascript
for( ii in seq(1,2,0.01) ) {
    print(floor(ii))
}

# the the ceiling of a number using the function 'ceiling' (also known as 'ceil' in many languages)
# Math.ceil in javascript
for( ii in seq(1,2,0.01) ) {
    print(ceiling(ii))
}

# |x|, |-5|, |5|
absolute_value <- function(x) {
    if ( x < 0 ) {
        return (-1 * x)
    } else {
        return (x)
    }
}
