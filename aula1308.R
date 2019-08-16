nomes <- c("Steve", "Bill", "Martin")
literatura <- c(8.5, 9, 10)
matematica <- c(9, 9.5, 7)
DF1 <- data.frame(cbind(nomes, literatura, matematica))
DF1

library(tidyr)

df_tidy <- gather(DF1, disciplina, nota, nomes)
df_tidy

df_tidy2 <- gather(DF1, key=nomes, value=disciplinas)
df_tidy2

df_tidy3 <- gather(DF1, key=disciplinas, value=notas, -nomes)
df_tidy3


df_tidy4 <- gather(DF1, key=disciplinas, value=notas)
df_tidy4

df_tidy5 <- spread(df_tidy3, key=disciplinas, value=notas)
df_tidy5