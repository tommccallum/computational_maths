# Deriving the 2D rotation matrix

We talked about polar coordinates and cartesian.  What use are they?  The application we want to talk about is rotation.  This will join our trigonometry up with our linear algebra.

## Matrix Maths

A matrix has a number of rows and a number of columns ($R$ x $C$).

A **square matrix** has the same number of rows as columns - that is to say, it has the shape of a square.

This is not a square matrix (R=3,C=2):
```
[1 0]
[1 1]
[1 0]
```

This is a square matrix (R=C=3):
```
[1 0 0]
[1 1 0]
[1 1 1]
```

A matrix is a square matrix, with only 1's down the diagonal from left to right and all the rest 0's is called an **identity matrix**.  This is equivalent to our number 1 in normal arithmetic.

This is the identity matrix for 2 dimensions:
```
[1 0]
[0 1]
```

This is the identity matrix in 3 dimensions:

```
[1 0 0]
[0 1 0]
[0 0 1]
```

We can only multiply two matrices together if the COLUMNS of the LEFT one is the same as the ROWS of the RIGHT one.  For example: 

```
RxC   RxC = RxC
2x2   2x1 = 2x1
[a b] [x] = [ax+by]
[c d] [y] = [cx+dy]
```

This is not correct as we would end up with a 2x2 matrix which we do not have enough elements to fill:

```
RxC RxC   = RxC
2x1 2x2   = 2x2
[x] [a b] = ??
[y] [c d] = ??
```

Note the outer values give the resultant matrix size.  i.e. The ROWS of the left matrix and the COLUMNS of the right matrix, give the size RxC of the resultant matrix.

# Rotation

We take our formula to convert from polar coordinates to cartesian coordinates, note we use $\phi$ to represent the original angle our point is at:

$x=rcos(\phi)$

$y=rsin(\phi)$

We then want to rotate, i.e. add on another angle $\theta$ to our current angle $\phi$.

$x_{new} = r * cos(\theta+\phi)$

$y_{new} = r * sin(\theta+\phi)$

Using the following facts (see "Proving Trig Equalities slides for proof"):

$cos(\theta+\phi) = cos(\theta)cos(\phi)-sin(\theta)sin(\phi)$

$sin(\theta+\phi) = sin(\theta)cos(\phi)+cos(\theta)sin(\phi)$

we get the following:

$x_{new} = r * cos(\theta)cos(\phi)-r*sin(\theta)sin(\phi)$

$y_{new} = r * sin(\theta)cos(\phi)+r*cos(\theta)sin(\phi)$

More explicitly:

$x_{new} = (r * cos(\phi)) * cos(\theta)+-1*(r*sin(\phi))*sin(\theta)$

$y_{new} = (r * cos(\phi)) * sin(\theta)+(r*sin(\phi))*cos(\theta)$

Substiting the formulas for $x$ and $y$ above:

$x_{new} = xcos(\theta)-ysin(\theta)$

$y_{new} = xsin(\theta) + ycos(\theta)$

These equations are linear (there are no $x^2$ or higher).  

You can see that this is just 2 linear combinations.  We can then therefore extract the following matrices (we use a to represent our angle here):

```
[cos(a) -sin(a)]
[sin(a) cos(a)]
```

and

```
[x]
[y]
```