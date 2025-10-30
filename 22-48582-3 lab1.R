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











