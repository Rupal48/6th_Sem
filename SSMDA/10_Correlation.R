# Example data
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)

# Calculate Pearson correlation coefficient
cor(x, y, method = "pearson")

# Calculate Spearman correlation coefficient
cor(x, y, method = "spearman")

# Calculate Kendall correlation coefficient
cor(x, y, method = "kendall")