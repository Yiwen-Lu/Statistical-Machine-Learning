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
  # initialize prediction:
  pred <- data.frame(x0 = x0, y0 = NA)
  for (i in 1:n0) {
    dist <- distance(x, x0[i])
    rk <- rank(dist, ties.method = "random")
    nn_idx <- which(rk <= K)  # get indices of NNs
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
