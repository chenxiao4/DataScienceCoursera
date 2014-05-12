Cache Inverse of Matrix
========================================================


Create special object:

```r
x <- makeCacheMatrix()
mat <- matrix(1:4, 2, 2)
mat
```

```
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
```



Initialize the object:

```r
x$set(mat)
x$get()
```

```
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
```



Calculate the inverse of the matrix:

```r
inv <- cacheSolve(x)
inv
```

```
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
```


Calculate the inverse of the matrix again:

```r
inv <- cacheSolve(x)
```

```
## getting cached data
```


Check the result:

```r
x$getinverse()
```

```
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
```

