data <- read.csv(file="papers_data_noise.csv", header=TRUE, sep=",")
data <- subset(data, select = -X)

subt <- read.csv(file="papers_subt_noise.csv", header=TRUE, sep=",")
subt <- subset(subt, select = -X)

data<- data[(!is.na(data$paper)),]
subt<- subt[(!is.na(subt$paper)),]

subtopics <- subt$subtopics
dataFrame <- data.frame(data, subtopics)

dataFrame <- dataFrame[(dataFrame$year >= 2000),]

confs <- unique(dataFrame$conf)
conferencias <- c()

for (i in 1:length(confs)) {
  conferencias <- c(conferencias, paste("conf", confs[i], sep=''))
}

subt <- read.csv(file="topics.csv", header=TRUE, sep=";")

idSubtopics <- subt$subtopic

library(BBmisc)

idSubtopics <- append(idSubtopics, conferencias)
idSubtopics <- append(idSubtopics, "aceito", after = length(idSubtopics))

dados <- setNames(data.frame(matrix(ncol = length(idSubtopics), nrow = 0)), idSubtopics)

#install.packages("BBmisc")

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
  conf <- as.character(dataFrame[i, "conf"])
  conferencia <- paste("conf", conf, sep='')
  dados[i, conferencia] = 1
}

dados[is.na(dados)] = 0

library(arules)
dados <- as.matrix(dados)

varApriori <- apriori(dados, parameter = list(sup = 0.05, conf = 0.7))
inspect(sort(varApriori, decreasing = TRUE, by="confidence"))
