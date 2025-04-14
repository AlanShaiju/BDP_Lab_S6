#Write a R program to create a simple bar plot of five subjects’ marks.
marks<-c(50,40,60,80,75)
subj<-c('math','science','english','economics','malayalam')
barplot(marks,names.arg=subj)
