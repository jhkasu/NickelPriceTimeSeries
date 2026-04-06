# base + graphics package (it comes with R installation)
# ggplot2
# plotly
# lattice

data(iris)
colnames(iris)
x = iris$Petal.Length
y = iris$Sepal.Length

plot(x, y, pch = 16, xlab = 'Petal.Length', ylab = 'Sepal.Length', 
     main = 'Petal.Length vs Sepal.Length', col = iris$Species)

# 색 넣어서 구분 할 때 범례 표시해주는게 좋다.
legend('topleft', legend = unique(iris$Species), 
       fill = unique(iris$Species), bty = 'n')


x = seq(-10, 10, by = 0.1)
y1 = sin(x)
y2 = cos(x)
plot(x, y1, type = 'l', col = 'blue')
lines(x, y2, col = 'red', lty = 2)
# y = a + bx -> abline()
abline(a = 0, b = .1, col = 'green')
abline(v = 2, col = 'magenta', lwd = 4, lty = 3) # x = 2, it is a vertical line --- y = 3, it is a horizontal line
points(x = seq(-10, 10, by = 1), y = exp(seq(-10, 10, by = 1)), col = 'cyan', pch = 3)

data("mtcars")
head(mtcars)
str(mtcars)
hist(mtcars$mpg, breaks = 10, col = 'red')

#set.seed(12)
#x = rnorm(n = 100, mean = 0, sd = 1)
#hist(x, breaks = 20, xlim = c(-4,4), col = 'blue', freq = F)

t = (-400:400)/100; set.seed(12)
par(mfrow=c(2,2))
for (n in c(100, 500, 1000, 5000)) {
  x = rnorm(n=n, mean=0, sd = 1)
  hist(x, breaks = 50, freq = F, main=paste('n=', n),
       xlim = c(-4,4), ylim = c(0,.8))
  lines(t, dnorm(t, 0.1), lwd = 2, col = 'blue')
}

