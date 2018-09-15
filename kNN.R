rm(list = ls())

work_dir <- "/home/lu/Documents/Vorlesung/SoSe2018/MLinR/RT2_kNN"
setwd(work_dir)
set.seed(42)

distance <- function(a, b, norm = 1) {
  if (norm == 1) {
    return(abs(a - b))
  } else if (norm == 2) {
    return(sqrt(sum((a-b)^2)))
  } else {
    stop("only supports Manhattan & Euclidean distance")
  }
}

KNN_prediction <- function(x, y, K, x0) {
  n0 <- length(x0)
  # initialize prediction set:
  pred <- data.frame(x0 = x0, y0 = NA)
  
  for (i in 1:n0) {
    dist <- distance(x, x0[i])
    rk <- rank(dist, ties.method = "random")
    nn_idx <- which(rk <= K)  # get indices of K-NNs
    "
    prediction is Pr(y = 1), if y is binary, i.e. {0,1};
    prediction is the mean,  if y is continuous.
    "
    pred$y0[i] <- mean(y[nn_idx])
  }
  return(pred)
}

# testing --------------------------------------------
x <- rnorm(100)
y <- rnorm(100)
x0 <- runif(10)

pred <- KNN_prediction(x, y, K = 5, x0)
print(pred)

# using flight data  ---------------------------------

# load data:
file <- "flights_small.csv"
flights_small <- read.table(file, sep = ',', header = TRUE)

#View(flights_small)
summary(flights_small)

arr <- flights_small$arr_delay
dep <- flights_small$dep_delay
x0 <- seq(from = 10, to = 50, length.out = 100)

# predict:
pred1 <-KNN_prediction(dep[1:1000], arr[1:1000], 10, x0)
pred2 <-KNN_prediction(dep[1:10000], arr[1:10000], 10, x0)
pred3 <-KNN_prediction(dep[1:1000], arr[1:1000], 50, x0)
pred4 <-KNN_prediction(dep[1:10000], arr[1:10000], 50, x0)

# plot -----------------------------------------------
plot(x = pred1$x0, y = pred1$y0, type = "l", col = "blue", ylim = c(0, 60),
     xlab = "flight delay at departure", ylab = "flight delay at arrival")
# add lines:
lines(x = pred2$x0, y = pred2$y0, col = "green")
lines(x = pred3$x0, y = pred3$y0, col = "pink")
lines(x = pred4$x0, y = pred4$y0, col = "orange")
