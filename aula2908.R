

x<-data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
x[1,2] = NA
x[(x$var1 <= 2 & x$var3>10),]
x[!is.na(x$var2),]

#numeros aleatorios
set.seed(10); rnorm(5)

var <- read.csv(file="C:/Users/Felipe/Downloads/fakeMarvelData.csv", header=TRUE, sep=",")
data.frame("Nome"=var$Nome, "Afiliação"=var$Afiliação, "QI"=var$QI)

var[(!is.na(var$QI)),]
library("plyr")
ok <- var[(var$QI > 70 & !is.na(var$QI)),]
ok[order(ok$QI),]
