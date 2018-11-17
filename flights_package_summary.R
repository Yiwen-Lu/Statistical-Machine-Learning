# clear memory:
rm(list = ls())

# install package:
# install.packages("nycflights13")

# load package:
library(nycflights13)

# load data:
data(flights)
View(flights)

# max 'air_time':
max_air_time <- max(flights$air_time, na.rm = TRUE) # remove the N/A!!!
print(max_air_time)

# mean of 'distance':
mean_dist <- mean(flights$distance, na.rm = TRUE)
print(mean_dist)

# summary:
print(summary(flights))
