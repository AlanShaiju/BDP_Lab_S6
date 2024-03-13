#task1
ds1<-data.frame(ID=1:5,name=c('A','B','C','D','E'))
ds2<-data.frame(ID=1:5,salary=c(100,200,500,800,700))
merged_data<-merge(ds1,ds2,by='ID')
merged_data

#task2

l1=c('r','a','c','e','c','a','r')
l2=c('l','e','v','e','l','d','')
l3=c('l','e','k','s','l','','')
ndf<-data.frame(l1,l2,l3)
ndf
ndf<-t(ndf)
ndf
sf=''
sr=''
z=c()
ncol(ndf)
for(i in 1:nrow(ndf)){
  for(j in 1:ncol(ndf)){
    s1=ndf[i,j]
    sf=paste(sf,s1,sep='')
    sr=paste(s1,sr,sep='')
  }
  if(sf==sr)
  {
    cat('palindrome in row:',i,'\n')
    z<-append(z,TRUE)
  }
  else
  {
    cat('no palindrome in',i,'\n')
    z<-append(z,FALSE)
  }
  sf=''
  sr=''
}
ndf<-cbind(ndf,z)
ndf
write.csv(ndf,'palindrome.csv',row.names=FALSE)
#task3

example<-matrix(1:9,nrow=3,ncol=3)
example
max_row<-apply(example,1,max)
max_col<-apply(example,2,max)
cat('Max in rows',max_row)
cat('Max in columns:',max_col)

#task4

factorial <- function(n) {
  if (n == 0 | n == 1) {
    return(1)
  } else {
    return(n * factorial(n - 1))
  }
}
fibonacci_factorial <- function(x) {
  is_perfect_square <- function(n) {
    sqrt_n <- sqrt(n)
    return(identical(sqrt_n - as.integer(sqrt_n), 0))
  }
  if (is_perfect_square(5 * x^2 + 4) || is_perfect_square(5 * x^2 - 4)) {
    cat("Number", x, "is part of the Fibonacci sequence.\n")
    cat("Factorial of", x, ":", factorial(x), "\n")
  } else {
    cat("Number", x, "is not part of the Fibonacci sequence.\n")
  }
}
number <- as.integer(readline(prompt = "Enter a number: "))
fibonacci_factorial(number)

