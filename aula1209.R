a <- c(1,1,0,0,1)
b <- c(0,1,0,1,1)
c <- c(0,1,1,0,1)
goal <- c(1,0,1,0,1)

myDf <- cbind(a,b,c,goal)
myDf
library(arules)
var <- apriori(myDf, parameter = NULL, appearance = NULL, control = NULL)
inspect(var)

subConjunto <- subset(var, (lhs %in% "goal"))
subConjunto
inspect(subConjunto)


var <- read.csv(file="C:/Users/Felipe/Downloads/_ASSOC00.csv", header=TRUE, sep=",")
var
var <- subset(var, select = -Cesta)
ncol(var)
for (i in 1:ncol(var)) {
  var[,i] = as.factor(var[,i])
}

varApriori <- apriori(var, parameter = list(sup = 0.1, conf = 0.9))
inspect(varApriori)
