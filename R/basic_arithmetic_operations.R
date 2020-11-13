# basic arithmetic operations are as you would expect
a <- 5
b <- 2
a+b
a-b
a/b
a*b
a %% b          # modulo
a^b             # exponent
a/0             # cannot divide by zero
is.infinite(a/0)

# there are two special values
a <- NULL

is.null(a)
is.na(a)
a+b
a-b
a/b
a*b
a %% b          # modulo
a^b             # exponent
a/0             # cannot divide by zero
is.infinite(a/0)

# or NA which means a missing value
a <- NA

is.na(a)    
is.null(b) # false
a+b
a-b
a/b
a*b
a %% b          # modulo
a^b             # exponent
a/0             # cannot divide by zero
is.infinite(a/0)
