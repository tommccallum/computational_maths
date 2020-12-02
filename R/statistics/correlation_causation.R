# Correlation
angle <- seq(-pi,pi,by=0.01)
x <- sin(angle)
y <- cos(angle)
corr(x,y)       # not correlated (0)

corr(x,x)       # correlated at 1

corr(-x,x)      # anti-correlated at -1

plot(angle,x,col="white", main="Correlation")
lines(angle,x,col="green",lwd=3)
lines(angle,-x,col="red",lwd=3)
lines(angle,y, col="gray", lwd=3)

# you can be correlated but through time
# using acf and ccf functions
ccf(x,y, lag.max=300)

# Two things can be correlated but one does
# not have to cause the other.
# e.g. prices of steel may be correlated with
#       price of cotton, but there may be
#       no causal connection.
#
# What are some alternatives that could be happening
#   if event A is correlated to event B?
#
#   (Dependent) A could be causing B.
#   (Dependent) B could be causing A.
#   (Common cause) A and B are correlated because they are both caused by event C.
#   (Additional variable) A does cause B, as long as D happens.
#   (Chain reaction) A causes E which causes B, but you only observed A and B.


# if you find CORRELATION
# then you can TEST for CAUSATION
#
# You do this by doing your hypothesis testing
# or A/B testing.
# However you need to control other variables as much as possible.
#
# HYPOTHESIS TESTING
#
# In a hypothesis you have a independent variable (the causing variable) and
# the dependent variable (the caused variable).  
#
# H0: Null Hypothesis : There is no causation between two factors.
# H1: Primary Hypothesis : There is causation between two factors.
#
# H0: Null Hypothesis : There is no difference between treatment A and B.
# H1: Primary Hypothesis : There is a difference between treatment A and B.
#
# We can use a range of tests to try and accept our hypothesis.

t.test(x,y) # p value of 0.97, 97% change the null hypothesis is correct.

# FALSE POSITIVES       We accepted H1, H0 was true.        Diagnosed with cancer, no cancer was detected but went through chemo anyway. 
# TRUE POSITIVES        We accepted H1, H1 was true.        Diagnosed with cancer, cancer was detected and cured.
# FALSE NEGATIVES       We rejected H1, H1 was true.        Not diagnosed with cancer, cancer was there, died.  
# TRUE NEGATIVES        We rejected H1, H0 was true.        Not diagnosed with cancer, cancer was not there, lived.

