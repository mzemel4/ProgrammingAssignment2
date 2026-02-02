## This function creates a list (attached to a vector) that stores the inverse value.  This can then be "cached" or accessed directly without recalculation.  This function defines the added list elements required to get/set a matrix and get/set inverse of a matrix.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        d <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
                
                        }
        get <- function() x
        setinverse <- function(inverse)  m <<- inverse 
        getinverse <- function() m
        list(set = set, get = get,getinverse = getinverse, setinverse = setinverse)  
}  

      


## This function calculates the inverse of a specific matrix only once and then accesses it from cache in all future instances

cacheSolve <- function(x = list()) {
        ## Returns a matrix that is the inverse of 'x'
        ## x is a list of the form cacheMatrix defined above (with elements get,set,getinverse,setinverse - all functions)

                i <- x$getinverse()
                if(!is.null(i)) {
                
                message("Retrieving Inverse Matrix from Cache")
                return(i)
                }                
                
                i <- solve(x$get())
                matrixlist$setinverse(i)
                return(i)
}
