# Lendo dataset de repositório
fundamentals <- "https://gitlab.com/dados/open/raw/master/br-stocks-fundamentals.csv"
download.file(fundamentals, destfile = "./data.csv")
csv <- read.csv(file="data.csv", header=TRUE, sep=",")

# Selecionando algumas variáveis para mostrar o head
fundamentals
library(dplyr)
library(readr)
library(rpart)
library(rpart.plot)
library(xtable)
class(csv$ret_anual)
arrange(csv,desc(csv$ret_anual))
csv <- subset(csv, select = c("ret_anual", "pl", "codigo", "vm", "p_vpa", "divbr_pl"))
print(xtable(head(csv)), type = "html", digits = 2, include.rownames=FALSE)





entropy <- (-(22/35)*log2(22/35))-((13/35)*log2(13/35))
entropyFilho <- (-(19/21)*log2(19/21))-((2/21)*log2(2/21))
entropyFilho2 <- (-(3/14)*log2(3/14))-((11/14)*log2(11/14))
ganho <- entropy - (((21/35) * entropyFilho) + ((14/35) * entropyFilho2))

