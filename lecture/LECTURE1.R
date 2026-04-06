NA: not available
NaN: Not a Number
Inf: infinity






#format()
#abs()
#--------------#
#head()
#tail()
#str()
#unique()
#nrow()
#ncol
#length()
#table(data.frame$column)
#colnames()
#dim()
# how many differnt numbers you can see in sepal length? 
# nrow(unique(iris['Sepal.Length']))

# give the head of only the first 3 columns
# head(iris[1:3])

# give the head of the first and the fourth column
# head(iris[c(1,4)])

# give me only the rows that their Species are vericolor
# iris[iris$Species == 'versicolor', ]

# $ -> Easiest wa to access the columns
# dat[c(1,3)] -> 1 col and 3 col 만 프린트

# head(iris[(iris$Species == 'versicolor')&(iris$Sepal.Length<=4),])
x = 3
y = 5
if (x == y) {
  print('x and y are equal')
} else {
  print('x and y are not equal')
}

y = 0
if (y>0) {
  sprintf('%d is a positive number. \n', y)
} else if (y < 0) {
  cat(sprintf('%d is a negative number. \n', y))
} else {
  cat(sprintf('%d is neither a positive number nor a negative numbers. \n',y))
}


for (i in 1:5) {
  print(i)
}

set.seed(123)
y = sample(-10:10, 5, replace = F)

for (i in 1:length(y)) {
  if (y[i]>0) {
    cat(sprintf('%d is a positive number. \n', y[i]))
  } else if (y[i] < 0) {
    cat(sprintf('%d is a negative number. \n', y[i]))
  } else {
    cat(sprintf('%d is neither a positive number nor a negative numbers. \n',y[i]))
  }
}

i = 5
while (i > 0) {
  print(i)
  i = i-1
}

# 1- using iris dataset, give the subset of the dataset that all the species are setosa and 
# the sepal.length are at least 6.
# nrow((iris[(iris$Sepal.Length>=6),]))

# 2- use for and if to check if a number between 1 to 100 is even or odd
for (i in 1:100) {
  if (i%%2 == 0) {
    cat(sprintf('%d is a even number. \n', i))
  } else {
    cat(sprintf('%d is a odd number. \n', i))
  }
}
# 3- For numbers 1 to 20:
# print "Fizz" if divisable by 3
# print "Buzz" if divisable by 5
# print "FizzBuzz" if divisable by both
# If it does not divisable by any of them then print the number
for (i in 1:20) {
  if (i %% 3 == 0 & i%%5 == 0) {
    print('FizzBuzz')
  } else if (i %% 5 == 0) {
    print('Buzz')
  } else if (i %% 3 == 0) {
    print('FizzBuzz')
  } else {
    print(i)
  }
}
