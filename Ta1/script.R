# I'm using iris dataset
# let x be sepal.length; and y be petal.length
fd <- data.frame(x = iris$Sepal.Length, y = iris$Petal.Length)

# Task 1a
removeHalfX <- function(fdp) {
  ret = fdp
  med = median(fdp$y)
  ret$x[ret$y > med] <- NA
  return(ret)
}
ad <- removeHalfX(fd)

# Task 1b
model1 <- lm(x ~ y, data=ad)
fitad <- ad
fitad$x <- predict(model1, ad)

# Task 1c
model2 <- lm(x ~ y, data=fd)
fitfd <- fd
fitfd$x <- predict(model1, fd)

# Task 1d
par(mfrow=c(1,2), pch = 16, cex = 0.75)
plot(fd, col="red", main = "Full data")
points(fitfd)

plot(ad, col="red", main = "Available data")
points(fitad)
