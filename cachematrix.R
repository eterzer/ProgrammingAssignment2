## The following pair of functions cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInv <- function(inverse) inv <<- inverse
  getInv <- function() inv
  list(set = set,
       get = get,
       setInv = setInv,
       getInv = getInv)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the 
## cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInv()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInv(inv)
  inv
}

# #Test
# > x <- matrix(c(1,2,3,0,1,4,5,6,0), nrow=3, ncol=3)
# > m <- makeCacheMatrix(x)
# > m$get()
# [,1] [,2] [,3]
# [1,]    1    0    5
# [2,]    2    1    6
# [3,]    3    4    0
# > cacheSolve(m)
# [,1] [,2] [,3]
# [1,]  -24   20   -5
# [2,]   18  -15    4
# [3,]    5   -4    1
# > 
#   > cacheSolve(m)
# getting cached data
# [,1] [,2] [,3]
# [1,]  -24   20   -5
# [2,]   18  -15    4
# [3,]    5   -4    1
