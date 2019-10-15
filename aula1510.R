

library(psych)
galton
galton.br <- data.frame(galton)
names(galton.br) <- c("pai", "filho")
galton.br

regrOrigem <- function (angulo) {
  x <- galton$child - mean(galton$child)
  y <- galton$parent - mean(galton$parent)
  dadosFr <- as.data.frame(table(x,y))
  names(dadosFr) <- c("filhos", "pais", "frequencia")
  cor(x,y)
  plot(as.vector(x), as.vector(y), cex = 0.1*dadosFr$frequencia)
  abline(0, angulo)
  erroMQ <- mean(y-angulo*x)^2
  title(erroMQ)
}

regrOrigem2 <- function () {
  x <- galton$child - mean(galton$child)
  y <- galton$parent - mean(galton$parent)
  dadosFr <- as.data.frame(table(x,y))
  names(dadosFr) <- c("filhos", "pais", "frequencia")
  cor(x,y)
  plot(as.vector(x), as.vector(y), cex = 0.1*dadosFr$frequencia)
  abline(0, 360)
  saida <- cor(x,y)
  abline(0, saida)
}
regrOrigem2()

library(plotly)
library(manipulate)
manipulate(regrOrigem(angulo = angulo), angulo=slider(-6, 6, step=0.5))

