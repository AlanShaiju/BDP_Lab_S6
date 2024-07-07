#Write a R program to create a list of random numbers in normal distribution and count occurrences of each value.
x<-rnorm(20,2,4)
x<-round(x,0)
table(x)
