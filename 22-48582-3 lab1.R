#LAB 1

num_vec <- c(1, 2, 3, 4, 5)
print(num_vec)

char_vec <- c("Apple", "Banana", "Cherry")
print(char_vec)

log_vec <- c(TRUE, FALSE, TRUE, FALSE)
print(log_vec)

vec1 <- c(2, 4, 6)
vec2 <- c(1, 3, 5)
sum_vec <- vec1 + vec2  
prod_vec <- vec1 * vec2
print(sum_vec)   

print(prod_vec)

num_vec <- c(10, 20, 30, 40, 50)
print(num_vec[2])

print(num_vec[c(1, 3, 5)]) 

print(num_vec[num_vec > 25])

num_vec[2] <- 100
print(num_vec)

num_vec <- c(num_vec, 60, 70)
print(num_vec) 

vec <- c(5, 10, 15, 20, 25)
print(length(vec)) 

print(sum(vec))

print(mean(vec))

sorted_vec <- sort(vec, decreasing = TRUE)
print(sorted_vec) 

seq_vec <- seq(1, 10, by = 2)
print(seq_vec) 

rep_vec <- rep(c(1, 2, 3), times = 3) 
print(rep_vec) 

mat <- matrix(1:12, nrow = 4, ncol = 3)
print(mat)

mat <- matrix(1:9, nrow = 3, byrow = TRUE)
print(mat)

mat <- matrix(1:9, nrow = 3)
rownames(mat) <- c("Row1", "Row2", "Row3")
colnames(mat) <- c("Col1", "Col2", "Col3")
print(mat)

mat <- matrix(1:9, nrow = 3)
print(mat[2, 3])
print(mat[1, ])
print(mat[, 2])

mat1 <- matrix(1:4, nrow = 2)
mat2 <- matrix(5:8, nrow = 2)
sum_mat <- mat1 + mat2
print(sum_mat)

prod_mat <- mat1 * mat2
print(prod_mat)

dot_prod_mat <- mat1 %*% mat2 
print(dot_prod_mat)

t_mat <- t(mat)
print(t_mat)

square_mat <- matrix(c(2, 3, 1, 4), nrow = 2)
inv_mat <- solve(square_mat)
print(inv_mat)

#ARRAY

arr <- array(1:27, dim = c(3, 3, 3))
print(arr)

arr <- array(1:18, dim = c(3, 3, 2))
print(arr[2, 3, 1])


arr1 <- array(1:18, dim = c(3, 3, 2))
arr2 <- array(19:36, dim = c(3, 3, 2))
sum_arr <- arr1 + arr2
print(sum_arr)

prod_arr <- arr1 * arr2
print(prod_arr)


arr <- array(1:18, dim = c(3, 3, 2))
print(sum(arr))
print(mean(arr))

apply(arr, MARGIN = 1, FUN = sum)

apply(arr, MARGIN = 2, FUN = mean)

#Data Frames

df <- data.frame(
  ID = c(101, 102, 103, 104),
  Name = c("Alice", "Bob", "Charlie", "David"),
  Age = c(23, 25, 22, 24),
  Score = c(89.5, 76.0, 91.2, 88.8),
  Passed = c(TRUE, FALSE, TRUE, TRUE)
)
print(df)

print(df$Name)

print(df[2, ])  

print(df[3, "Score"]) 

print(df[, c("Name", "Score")])  

print(df[1:2, ])

df$Grade <- c("A", "B", "A+", "A-")
print(df)

passed_students <- df[df$Passed == TRUE, ]
print(passed_students)

high_scorers <- df[df$Score > 85, ]
print(high_scorers)

df_sorted <- df[order(df$Age), ]
print(df_sorted)

df_sorted_desc <- df[order(-df$Score), ]
print(df_sorted_desc)

df$Score[df$Name == "Bob"] <- 80
print(df)

colnames(df) <- c("Student_ID", "Student_Name", "Student_Age", "Exam_Score", "Passed_Exam", "Fin
 al_Grade")
print(df)

df$Grade <- NULL
print(df)

df <- df[-2, ]
print(df)

summary(df)

# List

my_list <- list(
  Name = "Alice",
  Age = 25,
  Scores = c(90, 85, 88),
  Passed = TRUE
)
print(my_list)

print(my_list[[1]]) 

print(my_list$Scores) 

print(my_list$Scores[2]) 

my_list$Age <- 26
print(my_list$Age) 

my_list$Country <- "USA"
print(my_list)

my_list$Passed <- NULL
print(my_list)

my_complex_list <- list(
  Numbers = c(1, 2, 3, 4),
  Matrix = matrix(1:9, nrow = 3),
  DataFrame = data.frame(ID = c(101, 102), Name = c("Bob", "Charlie"))
)
print(my_complex_list)

print(my_complex_list$Matrix[2, 3]) 

list1 <- list(A = 1:5, B = "Hello")
list2 <- list(C = c(TRUE, FALSE), D = matrix(1:4, nrow = 2))
merged_list <- c(list1, list2)
print(merged_list)

list_to_df <- data.frame(
  Name = c("Alice", "Bob"),
  Age = c(25, 27),
  Score = c(89, 92)
)
print(list_to_df)

# Exercises

# Exercise 1:

scores <- sample(50:100, 8, replace = TRUE)
print(scores)
print(min(scores))
print(max(scores))
print(mean(scores))
print(median(scores))
city <- c("Dhaka", "Chattogram", "Khulna", "Sylhet", "Rajshahi")
print(city)

# Exercise 2:

student_info <- list(
  name = "Alice",
  age = 20,
  grades = c(85, 90, 78)
)
print(student_info)
print(student_info$age)
print(student_info$grades[2])

# Exercise 3:

mat <- matrix(1:16, nrow = 4, ncol = 4)
print(mat)
print(mat[3, ])
print(mat[, 2])
sum_diag <- sum(diag(mat))
print(sum_diag)


# Exercise 4:
students <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David"),
  Math = c(85, 78, 92, 88),
  English = c(90, 82, 95, 87)
)
print(students)
print(students$English)
students$Average <- (students$Math + students$English) / 2
print(students)

# Exercise 5:
blood_group <- factor(c("A", "B", "O", "AB", "A", "O"))
print(blood_group)
levels(blood_group)
table(blood_group)

# Exercise 6:
class <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Age = c(20, 21, 19, 22, 20),
  Gender = factor(c("Female", "Male", "Male", "Male", "Female")),
  Math = c(85, 78, 92, 88, 95),
  English = c(90, 82, 95, 87, 88),
  Science = c(88, 80, 90, 85, 92)
)

print(class)
class$Average <- rowMeans(class[, c("Math", "English", "Science")])
print(class)
high_achievers <- class$Name[class$Average > 80]
print(high_achievers)
table(class$Gender)








