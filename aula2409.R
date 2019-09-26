a <- c(1,1,0,0,1,1,0,1)
b <- c(0,1,0,1,1,0,0,0)
c <- c(0,1,1,0,1,1,1,0)
goal <- c(1,0,1,0,1,1,1,1)

df <- cbind(a,b,c,goal)
trans <- as(df[, -1], "transactions")
rules <- apriori(trans, list(supp = 0.01, conf = 0.01, minlen = 2))
cbind(as(rules, "data.frame"), conviction=interestMeasure(rules, "conviction", trans))
