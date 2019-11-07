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
