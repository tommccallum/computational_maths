# Session 3

$y = x$

where x is any real number and y is any real number that obeys this condition

$y = mx +c$

$gradient (m) = \frac{y_2 - y_1}{x_2-x_1}$

c is the y-intercept

$y - mx = mx + c - mx$

$y - mx = c$

$-y + mx = -c_1$

$-y + mx = c_2$

$-x_1 + mx_2 = c_2$

$-ax_1+mx_2 = c_2$

absorb - into a

$ax_1+mx_2 = c_2$

$-3x_1 + 5x_2 = 4$$

a = 3, m=5, c=4

a = -3, m=5, c=4

$x_1 = 2, x_2 = 3$

$a*2 + 5 * 3 = 13$

$a*2 = 13 -15$

$a*2 = -2$

$a = -1$

$-a*2 + 5 * 3 = 13$

$-a*2 = 13 - 15$

$-a * 2 = -2$

$-a = -1$

$a = 1$

when we see a constant named $c$ or $a$ constant named $a$, think "this is some number that is made to ensure the equality holds".

$ax_1+mx_2 = c_2$

$a_1x_1+a_2x_2 = c_2$

we can extend this to multiple dimensions:

$a_1x_1+a_2x_2 +a_3x_3 + a_4x_4 + .... = c_2$

we can also write this as :

$\sum_{i=0}^{i=N} a_i * x_i$

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

$\bar{a} \cdot \bar{x} = c$

note that $\cdot$ is called matrix multiplication, but this does not mean it obeys the same rules as normal multiplication.  It is a different operator.

In the 2d case, we can then rewrite out $y=mx+c$ as:

$\bar{a} = (m,1)$

$\bar{x} = (x,y)$

$c$ is just the same

when we multiply this out:

$m*x + 1 * y = c$

$y = c - mx$

$y = c + mx$

$y = mx + c$























