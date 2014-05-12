
## This function is more like a class objection in c++, we create a special object,
## and this object has two data members: matrix and its inverse ,and four member functions:
## get(), set(), setinverse(), and getinverse()

makeCacheMatrix <- function(x = matrix()) {
        
        ##initialize the inverse of the input matrix as NULL
        inverse <- NULL
        
        ##initialize or update the original input matrix, and reset inverse
        set <- function(y){
                x <<- y
                inverse <<- NULL
        }
        
        ##return the matrix
        get <- function() x
        
        ## set the inverse of the input matrix
        setinverse <- function(inv) inverse <<- inv
        
        ##return the inverse of the matrix
        getinverse <- function() inverse
        
        
        ##return the list of operations
        list(set = set,
             get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## This functiuon check if the inverse of the matrix is already solved and store in cache.
## if not, then we calculate and update its inverse.

cacheSolve <- function(x, ...) {
        
        ## get the inverse of the matrix
        inverse <- x$getinverse()
        
        ## if the reults is already calculated and stroed in the cache then return the inverse
        if (!is.null(inverse)){
                message("getting cached data")
                return(inverse)
        }
        
        ## else get the original matrix,  
        data <- x$get()
        
        ## set the identity matrix, 
        matrix.dimension <- ncol(data)
        id.matrix <- diag(matrix.dimension)
        
        ## then calculate the inverse,
        inverse <- solve(data, id.matrix, ...)
        
        ## and set the inverse of the matrix.
        x$setinverse(inverse)
        
        ## return it
        inverse
}
