data("faithful")
head(faithful)


install.packages("caret")
library(caret)
data <- faithful
inTrain <- createDataPartition(y=faithful$waiting, p=0.5, list=FALSE)
trainFaith <- faithful[inTrain,]
testFaith <- faithful[-inTrain,]
nrow(trainFaith)
nrow(testFaith)

plot(trainFaith$waiting, trainFaith$eruptions)

meuModeloLinear <- lm(eruptions ~ waiting, data=trainFaith)
summary(meuModeloLinear)
abline(meuModeloLinear)


new <- data.frame(waiting = seq(-3, 3, 0.5))
predict(meuModeloLinear, new)


var <- read.csv(file="C:/Users/Felipe/Downloads/GeyserUFSM.csv", header=TRUE, sep=",")

var <- subset(var, select = -X)
inTrain <- createDataPartition(y=var$espera, p=0.5, list=FALSE)
trainFaith <- var[inTrain,]
testFaith <- var[-inTrain,]
nrow(trainFaith)
nrow(testFaith)

plot(trainFaith$espera, trainFaith$erupcao)
meuModeloLinear <- lm(erupcao ~ espera, data=trainFaith)
abline(meuModeloLinear)
new <- data.frame(espera = c(200, 230, 245, 270))
predict(meuModeloLinear, new)