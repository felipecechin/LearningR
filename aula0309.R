var <- read.csv(file="C:/Users/Felipe/Downloads/vendas_lucro.csv", header=TRUE, sep=",")

zsVendas = (var$Vendas - mean(var$Vendas))/sd(var$Vendas)
zsLucro = (var$Lucro - mean(var$Lucro))/sd(var$Lucro)

var <- data.frame(var, zsVendas, zsLucro)

minMaxVendas <- (var$Vendas-min(var$Vendas))/(max(var$Vendas)-min(var$Vendas))
minMaxLucro <- (var$Lucro-min(var$Lucro))/(max(var$Lucro)-min(var$Lucro))

var <- data.frame(var, minMaxVendas, minMaxLucro)

fQuartil <- summary(var$Vendas)[2]
tQuartil <- summary(var$Vendas)[5]
interQuartilVendas <- (var$Vendas-median(var$Vendas))/(tQuartil-fQuartil)

fQuartil <- summary(var$Lucro)[2]
tQuartil <- summary(var$Lucro)[5]
interQuartilLucro <- (var$Lucro-median(var$Lucro))/(tQuartil-fQuartil)
var <- data.frame(var, interQuartilVendas, interQuartilLucro)
