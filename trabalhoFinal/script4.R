data <- read.csv(file="papers_data_noise.csv", header=TRUE, sep=",")
data <- subset(data, select = -X)

subt <- read.csv(file="papers_subt_noise.csv", header=TRUE, sep=",")
subt <- subset(subt, select = -X)

data<- data[(!is.na(data$paper)),]
subt<- subt[(!is.na(subt$paper)),]

subtopics <- subt$subtopics
dataFrame <- data.frame(data, subtopics)

dataFrame <- dataFrame[(dataFrame$year >= 2000),]

topics <- read.csv(file="topics.csv", header=TRUE, sep=";")

idTopics <- unique(topics$topic)

library(BBmisc)

idTopics <- append(idTopics, "aceito", after = length(idTopics))

dados <- setNames(data.frame(matrix(ncol = length(idTopics), nrow = 1)), idTopics)

#install.packages("BBmisc")

for (i in 1:nrow(dataFrame)) {
  ids <- dataFrame[i, "subtopics"]
  ids <- as.character(ids)
  ids <- explode(ids, "-")
  for (j in 1:length(ids)) {
    topicoSelecionado <- topics[(topics$subtopic = ids[j]),]
    if (nrow(topicoSelecionado) == 1) {
      dados[i, as.character(topicoSelecionado$topic)] <- 1
    }
  }
}

dados[is.na(dados)] = 0

library(arules)
dados <- as.matrix(dados)
dados

varApriori <- apriori(dados, parameter = list(sup = 0.01, conf = 0.4))
subConjunto <- subset(varApriori, (rhs %in% "rejeitado"))
inspect(sort(subConjunto, decreasing = TRUE, by="confidence"))
