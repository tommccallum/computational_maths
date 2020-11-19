# Session 3

In this session we are looking at working from the equation of a line to the linear combination and dot product.

We start with the equation of the line defined by:

$y = x$

where x is any real number and y is any real number that obeys this condition.  The gradient of this line is +1 and the y intercept value (constant) is 0.

The following is the equation of a line:

$y = mx +c$, m is the gradient and c is the y intercept

The gradient is defined as rise over run, in other words:

$gradient (m) = \frac{y_2 - y_1}{x_2-x_1}$

Goal: We want to rearrange this so that the x's and y's are on the same side.

$y - mx = mx + c - mx$ &nbsp;&nbsp;&nbsp;(1)

$y - mx = c$ &nbsp;&nbsp;&nbsp;(2)

In step 3 is we multiply both sides by -1.

$-y + mx = -c_1$ &nbsp;&nbsp;&nbsp;(3)

The $c_2$ is a constant that _absorbs_ the minus sign.  Because this value can be anything whether it is negative or not is irrelevant at this stage.

$-y + mx = c_2$ &nbsp;&nbsp;&nbsp;(4)

We rename the $y$ as $x_1$ and $x$ as $x_2$:

$-x_1 + mx_2 = c_2$ &nbsp;&nbsp;&nbsp;(5)

We then take the hidden 1 in $-x_1$ and make this constant explicit, calling it $a$.

$-ax_1+mx_2 = c_2$ &nbsp;&nbsp;&nbsp;(6)

Now we have a constant $a$ we can absorb the minus sign into the $a$, as we did with step 4.

$ax_1+mx_2 = c_2$ &nbsp;&nbsp;&nbsp;(7)

when we see a constant named $c$ or $a$ constant named $a$, think "this is some number that is made to ensure the equality holds".

$ax_1+mx_2 = c_2$ &nbsp;&nbsp;&nbsp;(8)

$a_1x_1+a_2x_2 = c_2$ &nbsp;&nbsp;&nbsp;(9)

we can extend this to multiple dimensions:

$a_1x_1+a_2x_2 +a_3x_3 + a_4x_4 + .... = c_2$ &nbsp;&nbsp;&nbsp;(10)

we can also write this as :

$\sum_{i=0}^{i=N} a_i * x_i$ &nbsp;&nbsp;&nbsp;(11)

or in code:

```
a = [ 1,2,3 ]
x = [ 4,5,6 ]
sum <- 0
for( i=0 to N) {
    sum += a[i] * x[i]
}
```

we can pull out a vector $\bar{a} = \{ a_1,a_2,a_3,... \}$

we can pull out a vector $\bar{x} = \{ x_1,x_2,x_3,... \}$

$\bar{a} \cdot \bar{x} = c$ &nbsp;&nbsp;&nbsp;(12)

note that $\cdot$ is called matrix multiplication or _dot product_, but this does not mean it obeys the same rules as normal multiplication.  It is a different operator.

Note if the vector $\bar{a}$ has 1 dimension and $\bar{x}$ has 1 dimension (1d) then we get the multiplication we are used to $a_1*x_1$.

In the 2 dimension (2d) case, we can then rewrite out $y=mx+c$ as:

$1 * y=m * x + c$

$\bar{a} = (m,1)$

$\bar{x} = (x,y)$

$c$ is just the same

when we multiply this out:

$m*x + 1 * y = c$

$y = c - mx$

$y = c + mx$

$y = mx + c$

### Question was why can we just absorb the minus signs into constants:

Let us first assume that we are finding $a$ for where we do not have a minus sign:

$a*2 + 5 * 3 = 13$

$a*2 = 13 -15$

$a*2 = -2$

$a = -1$

Now lets us assume we had kept the minus sign:

$-a*2 + 5 * 3 = 13$

$-a*2 = 13 - 15$

$-a * 2 = -2$

$-a = -1$

$a = 1$

You can see that the only difference between $a$ and $-a$ is that we get $-1$ or $1$.  The value is the same apart from the sign.  Therefore by absorbing the minus sign we do not change the equation overall, the equality still holds.

























