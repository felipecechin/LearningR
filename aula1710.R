#clustering

var <- iris
head(var)
?kmeans
#a funcao abaixo gera:
#1 clustering
#3 (parametro) cluster, cluster = grupo
cluster <- kmeans(var[,c(3,4)], 3)

plot(var[,c(3,4)],
     col = cluster$cluster,
     pch = 20, cex = 1)
points(cluster$centers, pch = 4, cex = 4, lwd=4)

paste(sum(cluster$cluster==1), sum(cluster$cluster==2), sum(cluster$cluster==3))


var <- read.csv(file="C:/Users/Felipe/Downloads/fakeBannerData.csv", header=TRUE, sep=",")
var <- var[,c(2,3)]


cluster <- kmeans(var, 6)
plot(var,
     col = cluster$cluster,
     pch = 20, cex = 1)
points(cluster$centers, pch = 4, cex = 4, lwd=4)
