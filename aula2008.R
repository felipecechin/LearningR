MyData <- read.csv(file="C:/Users/Felipe/Downloads/LD00.csv", header=TRUE, sep=",")



t <- c("", "oi", NA)
t <- c(12, "", NA)

MyData <- read.csv(file="C:/Users/Felipe/Downloads/LD00.csv", header=TRUE, sep=",", na.strings = c("", "NA"))

dados <- MyData['Precipitacao']
avector <- dados[,'Precipitacao']
a <- as.vector.factor(avector)
b <- as.numeric(a)
b[!complete.cases(b)] = mean(b, na.rm = TRUE)