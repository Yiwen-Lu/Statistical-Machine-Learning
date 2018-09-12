rm(list = ls())

work_dir <- "./RT2_kNN"
setwd(work_dir)
set.seed(42)

dist <- function(a, b, norm = 1) {
  if (norm == 1) {
    return(abs(a - b))
  } else if (norm == 2) {
    return(sqrt(sum((a-b)^2)))
  } else {
    print("sorry, do not support other norms.")
  }
}

KNN_prediction <- function(x, y, K, x0) {
  n0 <- length(x0)
  # initialize prediction:
  pred <- data.frame(x0 = x0, y0 = NA)
  for (i in 1:n0) {
    dist_x0i <- dist(x, x0[i])
    rk <- rank(dist_x0i, ties.method = "random")
    idx_nn <- which(rk <= K)  # get indices of NNs
    "
    prediction is Pr(y = 1), if y is binary, i.e. {0,1};
    prediction is the mean,  if y is continuous.
    "
    pred$y0[i] <- mean(y[idx_nn])
  }
  return(pred)
}

# testing --------------------------------------------
x <- rnorm(100)
y <- rnorm(100)
x0 <- runif(10)

pred <- KNN_prediction(x, y, K = 5, x0)
print(pred)
