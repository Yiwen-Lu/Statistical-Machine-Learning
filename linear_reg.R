rm(list = ls())

# load data:
library(nycflights13)
data(flights)
#View(flights)
summary(flights)

three_day_data <- subset(flights, year == 2013 & month == 10 & day %in% 1:3)
three_day_data$day <- as.factor(three_day_data$day)
print(table(three_day_data$day))

# linear regression 1 ---------------------------------------------------------
lm_fit1 <- lm(arr_delay ~ dep_delay, data = three_day_data)
print(summary(lm_fit1))

# plot ------------------------------------------------------------------------
plot(x = three_day_data$dep_delay, y = three_day_data$arr_delay, 
     xlab = "flight delay at departure", ylab = "flight delay at arrival",
     bty = "n", col = grey(0.3, 0.2)) # grey(level, alpha)
abline(lm_fit1, lwd = 1.5) # lwd - line width

# linear regression 2 ---------------------------------------------------------
lm_fit2 <- lm(arr_delay ~ dep_delay + day, data = three_day_data)
print(summary(lm_fit2))
