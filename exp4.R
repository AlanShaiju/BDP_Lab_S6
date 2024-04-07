x<-c(1,2,3,4,5)
y<-c(1,2,3,4,5)

m<-mean(x)
s<-0.00
cov<-0.00
for(i in x)
{
  s<-s+((i-m)^2)
}
sd<-sqrt((s/length(x)-1))
cat("Standard deviation is ",sd)
cat("Variance is ",var(x))
covar=cov(x,y)
cat("Covariance is ",covar)
cat("Correlatation is ",cor(x,y))
plot(x,y, main="scatter plot", xlab="x", ylab="y",cex=2,col='red')