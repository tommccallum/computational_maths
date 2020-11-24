# mandelbrot_naive.R
# "Naive" implementation of Mandelbrot Set in R
# Myles Harrison
# http://www.everydayanalytics.ca
# https://www.r-bloggers.com/2014/12/the-mandelbrot-set-in-r/

# Vectorized version
mandelbrot_vectorized <- function(xmin=-2, xmax=2, nx=500,
                                  ymin=-1.5, ymax=1.5, ny=500,
                                  n=100, showplot=TRUE,
                                  cols=colorRampPalette(c("blue","yellow","red","black"))(11)) 
{
  
  # variables
  x <- seq(xmin, xmax, length.out=nx)
  y <- seq(ymin, ymax, length.out=ny)
  c <- outer(x,y*1i,FUN="+")
  z <- matrix(0.0, nrow=length(x), ncol=length(y))
  k <- matrix(0.0, nrow=length(x), ncol=length(y))
  
  for (rep in 1:n) { 
    index <- which(Mod(z) < 2)
    z[index] <- z[index]^2 + c[index]
    k[index] <- k[index] + 1
  }
  
  if (showplot==TRUE) { image(x,y,k,col=cols, xlab="Re(c)", ylab="Im(c)")}
  
  return(k)
  
}

system.time(mandelbrot_vectorized(showplot=T))
#system.time(mandelbrot_vectorized(showplot=T,xmin=-0.7,xmax=-0.65,ymin=0.3,ymax=0.34,nx=1500,ny=1500))
