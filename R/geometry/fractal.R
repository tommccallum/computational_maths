# mandelbrot_naive.R
# "Naive" implementation of Mandelbrot Set in R
# Myles Harrison
# http://www.everydayanalytics.ca
# https://www.r-bloggers.com/2014/12/the-mandelbrot-set-in-r/

# parameters
cols=colorRampPalette(c("black","yellow","orange","black"))(11)
xmin = -2
xmax = 2
nx = 150
ymin = -1.5
ymax = 1.5
ny = 150
n=300

# variables
x <- seq(xmin, xmax, length.out=nx)
y <- seq(ymin, ymax, length.out=ny)
c <- outer(x,y*1i,FUN="+")  # generate x * y
z <- matrix(0.0, nrow=length(x), ncol=length(y))    # value of the mandelbrot function
k <- matrix(0.0, nrow=length(x), ncol=length(y))    # counter number of valid iterations

for (rep in 1:n) { 
    print(rep)
    for (i in 1:nx) { 
        for (j in 1:ny) { 
            # Mod(z) = sqrt(x^2 + y^2)
            if(Mod(z[i,j]) < 2 && k[i,j] < n) {
                z[i,j] <- z[i,j]^2 + c[i,j]         # this is a recursive function
                k[i,j] <- k[i,j] + 1                # k is a counter for each valid iteration
            }
        }
    }
}

image(x,y,k, col=cols)                              # show it as an image