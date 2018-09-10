rm(list = ls()) # clear memory

# Vector -------------------------------------------------------------
# a)
v_a <- seq(1, 19, 2)
print(v_a)

# b)
v_b <- rep(5, 20)
print(v_b)

# c)
v_c <- c("rm1210", "In Bruges", "All God\'s Children Can Dance")
print(v_c)

# d)
set.seed(42)
v_d <- rnorm(100)
print(v_d)

# Matrix -------------------------------------------------------------
# e)
m_e <- matrix(1:25, 5, 5, byrow = TRUE)
print(m_e)

# f)
m_f <- matrix(runif(400), 20, 20)
print(m_f)

# g)
m_g <- matrix(rbinom(40, 1, 0.5), 20, 2)
print(m_g)

# Dataframe ----------------------------------------------------------
# h)
df <- data.frame(a = 1:20, b = letters[1:20])
print(df)