data <- read.csv(file="papers_data_noise.csv", header=TRUE, sep=",")
data <- subset(data, select = -X)

subt <- read.csv(file="papers_subt_noise.csv", header=TRUE, sep=",")
subt <- subset(subt, select = -X)

data<- data[(!is.na(data$paper)),]
subt<- subt[(!is.na(subt$paper)),]


#verifica se os papers do primeiro csv estao alinhados com os papers do segundo csv
indiceIncorreto <- TRUE
for(i in 1:nrow(subt)){
  if(subt$paper[i] != data$paper[i]){
    indiceIncorreto = TRUE
  }
}


subtopics <- subt$subtopics
dataFrame <- data.frame(data, subtopics)

dataFrame <- dataFrame[(dataFrame$year >= 2000),]

#verifica se há algum status com valor incorreto
teste1 <- dataFrame[!(dataFrame$status == "accepted" | dataFrame$status == "rejected"),]




subt <- read.csv(file="topics.csv", header=TRUE, sep=";")

idSubtopics <- subt$subtopic
length(idSubtopics)

idSubtopics <- append(idSubtopics, "aceito", after = length(idSubtopics))
idSubtopics
class(idSubtopics)
length(idSubtopics)
dados <- setNames(data.frame(matrix(ncol = length(idSubtopics), nrow = 0)), idSubtopics)

#install.packages("BBmisc")
library(BBmisc)



for (i in 1:nrow(dataFrame)) {
  ids <- dataFrame[i, "subtopics"]
  ids <- as.character(ids)
  ids <- explode(ids, "-")
  for (j in 1:length(ids)) {
    dados[i, ids[j]] = 1
  }
  if (dataFrame[i, "status"] == "accepted") {
    dados[i, "aceito"] = 1
  }
}

dados[is.na(dados)] = 0

for (i in 1:ncol(dados)) {
  dados[,i] = as.factor(dados[,i])
}

library(arules)

varApriori <- apriori(dados, parameter = list(sup = 0.5, conf = 0.9, minlen=6, maxlen=6, maxtime=120))
subConjunto <- subset(varApriori, (rhs %in% "aceito=1"))
inspect(sort(subConjunto, decreasing = TRUE, by="confidence"))
