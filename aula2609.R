var <- read.csv(file="C:/Users/Felipe/Downloads/Insetos00.csv", header=TRUE, sep=",")
valores <- subset(var, select = -c(Inseto.ID, Classe.do.inseto))

abdomen <- c(3.2, 7.2, 20, -20)
antena <- c(4.2, 4.1, 20, -20)

plot(y = abdomen, x = antena)

plot(valores)
abline(0, -0.1)
abline(10, -0.2)
