#mycube <- function(x) {
#  return(x^3)
#}
#x = 3
#mycube(x)
#t = c(1, -3, 0, 7)
#mycube(t)

#bla = 3
#myfun <- function(x) {
#  x^2 + bla2
#}
#myfun(2)

y= 10
f <- function(x) {
  y=2
  y^2 + g(x)
}

g = function(x) {
  x*y
}

f(3)

# Write a function sum_n(n) that calculate the sum of numbers from 1 to n, using a for loop.
# Test it with n = 5 to get 15
sum_n <- function(n) {
  res = 0
  for (i in 1:n) {
    res = res + i
  }
  res
}
sum_n(5)

# Write a function factorial(n) that computes the factorial of n usning a while loop
# Test for n = 5 to get 120

factorial <- function(n) {
  res = 1
  while (n > 0) {
    res = res*n
    n = n-1
  }
  res
}
factorial(5)

