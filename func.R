rm(list = ls())

# function 1 ------------------------------------
squared_vector <- function(x) {
  return(x^2)
}

squared_vector(3)
squared_vector(c(2, 4))

# function 2 ------------------------------------
power_vector <- function(x, a = 2) {
  return(x^a)
}

power_vector(3)
power_vector(3, 4)
power_vector(c(2, 4))
power_vector(c(2, 4), 3)

# function 3 ------------------------------------
power_and_sum <- function(x, a = 2) {
  y <- x^a
  return(list(out1 = y, out2 = sum(y)))
}

power_and_sum(3)
power_and_sum(3, 4)
power_and_sum(c(2, 4))
power_and_sum(c(2, 4), 3)