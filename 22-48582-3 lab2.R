
#LAB 2

# if Statement

x <- 10
if (x > 5) {
  print("x is greater than 5")
}

# if…else Statement

x <- 3
if (x > 5) {
  print("x is greater than 5")
} else {
  print("x is 5 or less")
}

#if…else if…else Ladder

score <- 75
if (score >= 90) {
  print("Grade A")
} else if (score >= 80) {
  print("Grade B")
} else if (score >= 70) {
  print("Grade C")
} else {
  print("Grade F")
}

#for Loop

for (i in 1:5) {
  print(paste("Iteration", i))
}

i <- 1
repeat {
  print(i)
  i <- i + 1
  if (i > 5) break
}

for (i in 1:5) {
  if (i == 3) next
  print(i)
}

for (i in 1:5) {
  if (i == 4) break
  print(i)
}

#Built-in Functions

numbers <- c(10, 20, 30, 40, 50)
mean(numbers)

sum(numbers) 
length(numbers) 

pi_val <- 3.14159
round(pi_val, 2)

paste("Hello", "World")



# User-Defined Functions

add_numbers <- function(a, b) {
  return(a + b)
}

add_numbers(5, 3) 

is_even <- function(x) {
  if (x %% 2 == 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

is_even(4) 

greet <- function(name = "User") {
  paste("Hello", name)
}
greet() 

greet("Abir") 

numbers <- 1:5
squared <- sapply(numbers, function(x) x^2)
print(squared) 

# Data Read

data <- read.csv("D:\\Iris.csv")
head(data)

data <- read.table("D:\\Iris.CSV", header = TRUE, sep = "\t")
head(data)



# Exercise 1:

score <- 82
if (score >= 90) {
  print("Excellent")
} else if (score >= 75) {
  print("Good")
} else if (score >= 50) {
  print("Pass")
} else {
  print("Fail")
}

# Exercise 2:
numbers <- 1:10

for (num in numbers) {
  print(num^2)
}

# Exercise 3:

count <- 1

while (count < 20) {
  if (count %% 2 == 0) {
    print(count)
  }
  count <- count + 1
}

# Exercise 4:


multiply <- function(a, b) {
  return(a * b)
}
result <- multiply(6, 4)
print(result)

# Exercise 5:

calculate_stats <- function(numbers) {
  mean_val <- mean(numbers)
  median_val <- median(numbers)
  sd_val <- sd(numbers)
  return(list(
    Mean = mean_val,
    Median = median_val,
    Standard_Deviation = sd_val
  ))
}
nums <- c(10, 20, 30, 40, 50)
result <- calculate_stats(nums)
print(result)

# Exercise 6:



grade_result <- function(score) {
  if (score >= 90) {
    print("Grade: A")
  } else if (score >= 75) {
    print("Grade: B")
  } else if (score >= 50) {
    print("Grade: C")
  } else {
    print("Grade: F")
  }
}

grade_result(95)
grade_result(80)
grade_result(65)
grade_result(40)

# Exercise 6:

data <- read.csv("D:\\students.csv")
head(data)
str(data,5)
