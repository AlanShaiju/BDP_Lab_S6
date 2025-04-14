#Write a R program to create an array, passing in a vector of values and a vector of dimensions.
#Also provide names for each dimension

dimensions<-c(2,4)
namesofarray<-list(c('a','b'),c('c','d','e','f'))
myarray<-array(c(1,2,3,4,5,6,6,6),dim=dimensions,dimnames=namesofarray)
myarray
