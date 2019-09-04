nomes <- c("Steve", "Bill", "Martin")
literatura <- c(8.5, 9, 10)
matematica <- c(9, 9.5, 7)
fisica <- c(4, 5, 6)

#cbind retorna uma matriz com as colunas como sendo os valores das listas
cbind(nomes, literatura, matematica)

DF1 <- data.frame(cbind(nomes, literatura, matematica))
DF1

DF2 <- data.frame(cbind(nomes, literatura))
DF2


DF3 <- data.frame(cbind(nomes, literatura, matematica, fisica))
DF3

genero <- c("M", "F", "M", "F", "M")
g<- factor(genero)


library(tidyr)

df_tidy <- gather(DF3)
df_tidy

df_tidy2 <- gather(DF3, key="teste1", value="teste2", 1:1)
df_tidy2

df_tidy3 <- gather(DF3, key=disciplinas, value=notas, -nomes)
df_tidy3


df_tidy4 <- gather(DF1, key=disciplinas, value=notas)
df_tidy4

df_tidy5 <- spread(df_tidy3, key=disciplinas, value=notas)
df_tidy5
