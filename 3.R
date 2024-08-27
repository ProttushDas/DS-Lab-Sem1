## paste only MatNorm function here, AND NOTHING ELSE

MatNorm <- function(A, type, n, m)
{
  A <- as.matrix(0, nrow = n, ncol = m)
  value <- 0
  if(type == "frob")
  {
    for(i in 1:n)
      for(j in 1:m)
      {
        value <- value + A[i,j]^2
      }
  }
  if(type == "max")
  {
    value <- determinant(A)
  }
  else
  {
    stop("Invalid norm type")
  }
}

A=as.matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3)
