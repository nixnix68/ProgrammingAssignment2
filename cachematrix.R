## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The makeCacheMatrix function initializes a Matrix object 'x' and creates a list
## of four functions which can be run on this matrix 'x'
## These functions can also be thought of as methods
## The four functions/methods are :
## set() - 
## This sets the contents of the matrix 'x' based on the matrix supplied to it (as argument 'y')

## set() then sets the local variable 'm' to be NULL - To reflect the fact
## that no inverse matrix for the newly assigned matrix 'x' object currently exists.

## get() -
## This method/sub-function simply returns the current instance of the matrix refered to by 'x'

## setinverse() -
## This just sets the local 'm' variable to be equal to the argument 'inverse' that is fed into it
## The use of 'inverse' as an argument refers to it being fed in from the function cacheSolve 
## whoch uses the solve() function to calculate the inverse of the matrix

## getinverse() -
## This simply returns the contents of 'm' which will previously have been set to the inverse 
## of the matrix by the cacheSolve function (or will be NULL otherwise)

## The function makeCacheMatrix finally returns a list of these methods/sub-functions 
## which can then be accessed using the '$' commands 
## eg ExampleMatrix$get() or ExampleMatrix$set() commands

## The set/set-inverse sub-functions have to use the <<- assignment operator to change x or m

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)    
}


## Write a short comment describing this function
## The cacheSolve function takes the 'x' matrix that has been created by makeCacheMatrix
## and calls the getinverse() sub-function on it 
## If there is currently an inverse set i.e. 'm' is not null then the function prints a message
## to say that it is retrieving the cached data and prints the contents of 'm' - the inverse
## matrix
## If there is no currently calculated inverse matrix ie is.null(m) is true
## the x$get() method is used on the matrix to gets its contents which are fed into the
## local variable 'data'
## The solve() function is then used on this matrix to calculate its inverse which is then
## fed into the 'm' variable
## This is then assigned to the matrix object using the $setinverse() method
## Finally the contents of 'm' ie the inverse matrix are returned

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                 message("getting cached data")
                 return(m)
              }
         data <- x$get()
         m <- solve(data, ...)
         x$setinverse(m)
         m
}
