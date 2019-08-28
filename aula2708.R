var <- read.csv(file="C:/Users/Felipe/Downloads/z.csv", header=TRUE, sep=",")
headers <- sort(levels(unique(unlist(var))))
results <- data.frame(matrix(nrow=nrow(var),ncol=length(headers))) 
colnames(results) <- headers
results[!complete.cases(results)] = "Não"
lin <- nrow(var)
col <- ncol(var)

for (h in 1:length(headers)) {
  for (i in 1:lin) {
    for (j in 1:col) {
      if (headers[h] == var[i,j]) {
        results[i,h] = "Sim"
        break
      }
    }
  }
}