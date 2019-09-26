#Alunos: Felipe Cechin e Fernando Garcia
var <- read.csv(file="C:/Users/Felipe/Downloads/_ASSOC_VoleiStars.csv", header=TRUE, sep=",")
var
var <- subset(var, select = -c(X, X.1))

var$Jogadore.a.s <- gsub("?", "Á", var$Jogadore.a.s, fixed = TRUE)
var$Jogadore.a.s <- gsub("\xa0", "", var$Jogadore.a.s, fixed = TRUE)
var$Jogadore.a.s <- gsub("Fbio", "Fábio", var$Jogadore.a.s, fixed = TRUE)
var$Jogadore.a.s <- gsub("Brbara", "Bárbara", var$Jogadore.a.s, fixed = TRUE)
var$Jogadore.a.s <- gsub("shelda", "Shelda", var$Jogadore.a.s, fixed = TRUE)
var$Jogadore.a.s <- gsub("fabio", "Fábio", var$Jogadore.a.s, fixed = TRUE)
var$Jogadore.a.s <- gsub("ana", "Ana", var$Jogadore.a.s, fixed = TRUE)
var$Jogadore.a.s <- gsub("Barbara", "Bárbara", var$Jogadore.a.s, fixed = TRUE)
var$Jogadore.a.s <- gsub("sheldom", "Sheldom", var$Jogadore.a.s, fixed = TRUE)
var$Jogadore.a.s <- gsub("Agata", "Ágata", var$Jogadore.a.s, fixed = TRUE)
var$Jogadore.a.s <- gsub("emanuel", "Emanuel", var$Jogadore.a.s, fixed = TRUE)
var$Jogadore.a.s <- gsub("ricardo", "Ricardo", var$Jogadore.a.s, fixed = TRUE)

nomes <- as.character(var$Jogadore.a.s.1[1:8])

var <- subset(var, select = -Jogadore.a.s.1)

dataFrame <- data.frame()
for (i in 1:8) {
  for (j in 1:nrow(var)) {
    if(var$Resultado[j] == "GANHOU"){
      dataFrame[j, "resultado"] = 1
    }else{
      dataFrame[j, "resultado"] = 0
    }
    if (grepl(nomes[i],var$Jogadore.a.s[j], ignore.case = TRUE)) {
      dataFrame[j, nomes[i]] = 1
    } else {
      dataFrame[j, nomes[i]] = 0
    }
  }
}

for (i in 1:ncol(dataFrame)) {
  dataFrame[,i] = as.factor(dataFrame[,i])
}
dataFrame
library(arules)

#combinação vitoriosa e estrela
varApriori <- apriori(dataFrame, parameter = list(sup = 0.10, conf = 0.76))
subConjunto <- subset(varApriori, (rhs %in% "resultado=1"))
inspect(sort(subConjunto, decreasing = TRUE, by="confidence"))

#combinação perdedora
varApriori <- apriori(dataFrame, parameter = list(sup = 0.09, conf = 0.60))
subConjunto <- subset(varApriori, (rhs %in% "resultado=0"))
inspect(sort(subConjunto, decreasing = FALSE, by="confidence"))