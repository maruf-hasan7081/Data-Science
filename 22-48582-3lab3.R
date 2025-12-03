head(iris)

str(iris)

summary(iris)


mean(iris$Sepal.Length)

median(iris$Sepal.Length)

freq_table <- table(iris$Sepal.Length)
names(freq_table)[which.max(freq_table)]

range_val <- range(iris$Sepal.Length)
max(range_val) - min(range_val)

var(iris$Sepal.Length)

sd(iris$Sepal.Length)

IQR(iris$Sepal.Length)

quantile(iris$Sepal.Length, probs = c(0.25, 0.75))

install.packages("dplyr")
library(dplyr)


iris %>%
  group_by(Species) %>%
  summarise(
    count = n(),
    mean_sepal_length = mean(Sepal.Length),
    sd_sepal_length = sd(Sepal.Length),
    mean_petal_length = mean(Petal.Length),
    sd_petal_length = sd(Petal.Length)
  )


pairs(iris[, 1:4], main = "Scatterplot Matrix of Iris Data", col = iris$Species)