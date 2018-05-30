values <-c(9,-2,0,1,5)
#Es un vector atómico?
is.atomic(values)

typeof(values)

ages <- c(19, 7, 50, 70)
hermanos <- as.integer(ages)
typeof(hermanos)

days<-c("mon", "tue", "wed")
typeof(days)
sum(ages)
mean(ages)

complex2 <- c(2 + 4i, 3i)
comp <- complex2*complex2
typeof(complex2)
typeof(comp)
