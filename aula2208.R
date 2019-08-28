var <- read.csv(file="C:/Users/Felipe/Downloads/DimR00.csv", header=TRUE, sep=",")

x <- var[,1]
y <- var[,2]
myfit <- lm(y ~ x)
plot(x, y, data=myfit, geom=c("point", "smooth"))

factor(y)
var
dim(y)
length(unique(y))

similar <- function(vec, val, bound = 3, index = F) {
  close.index <- which(abs(vec - val) <= bound)
  if (index) return(close.index)
  return(vec[close.index])
}
d <- 1
d <- c(d,2)
d
conta <- 0
val <- c()
myMat <- matrix(nrow=10, ncol=10)
for (i in 1:10) {
  for (j in 1:10) {
    if (i == j) {
      conta <- conta + 1
      myMat[i,j] <- conta
    } else {
      myMat[i,j] <- 0
    }
  }
}

for (i in 1:10) {
  for (j in 1:10) {
    if (myMat[i,j] != 0) {
      val <- c(val, myMat[i,j])
    }
  }
}


