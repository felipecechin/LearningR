var <- data.frame(mtcars)
var$kpl <- var$mpg * 0.425
var$peso <- var$wt * 0.453

class(var$am)
var$am <- factor(var$am, levels = c(0,1), labels=c("Automatico", "Manual"))
class(var$am)

modelo <- lm(peso~kpl, data=var)
library(ggplot2)
qplot(peso, kpl,
      data = var,
      color = am,
      shape = am,
      geom = c("point","smooth"),
      xlab = "Peso em toneladas",
      ylab = "Kilometros por litro",
      main = "Modelo de regressão")



var <- read.csv(file="C:/Users/Felipe/Downloads/GeyserUFSM.csv", header=TRUE, sep=",")

var <- subset(var, select = -X)

meuModeloLinear <- lm(erupcao ~ espera, data=var)
qplot(espera, erupcao,
      data = var,
      geom = c("point","smooth"),
      xlab = "Espera",
      ylab = "Erupção",
      main = "Modelo de regressão")
new <- data.frame(espera = c(200, 230, 245, 270))
predict(meuModeloLinear, new)


library(psych)
galton
galton.br <- data.frame(galton)
names(galton.br) <- c("pai", "filho")
galton.br

hist(galton.br$filho, breaks=70)



library(plotly)
library(manipulate)

func <- function(parametro) {
  soma <- sum(parametro)
  num <- length(parametro)
  calc <- soma/num
  hist(galton.br$filho, breaks=70)  
  lines(c(parametro,parametro), c(0,150))
}

manipulate(func(parametro = parametro), parametro=slider(60, 75, step=1))
