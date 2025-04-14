#Write a R program to create a Data Frames which contain details of 5 employees and display the details
n<-'abcde'
empnames<-strsplit(n,split='')[[1]]
empnum<-c(1,2,3,4,5)
empsalary<-c(200,300,200,500,300)
data<-data.frame(empnames,empnum,empsalary)
data