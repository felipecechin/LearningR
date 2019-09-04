setwd('C:/Users/Felipe')
getwd()
file.exists('Documentos')
dir.create('Codigos')

url <- "www-usr.inf.ufsm.br/~joaquim/UFSM/DM/ds/usr_data.csv"
download.file(url, destfile = "usr_data.csv", method = "curl")

list.files()

x <- c(2, 4, 6, NA, 10)
mean(x, na.rm = TRUE)
complete.cases(x)
x[!complete.cases(x)] = mean(x, na.rm = TRUE)
x
min(x, na.rm = TRUE)
max(x, na.rm = TRUE)
summary(x)


y <- c(8.9, 19.2, 33.8, 34.9, 43.0, 49.5, 49.1, 77.8, 90.4, 81.1, 112.7, 108.1, 122.2, 143.3, 125.2, 157.3, 169.2, NA, 200.5, 203.0)
x <- 1:20
a <- rep(10, 20)
myfit <- lm(y ~ x)
library("ggplot2")
qplot(x,y, data=myfit, geom=c("point","smooth"))

