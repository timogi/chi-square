# Import the data
data <- read.delim("data.txt", row.names = 1)
head(data)

# Null hypothesis (H0): the row and the column variables of the contingency 
# table are independent.
# Alternative hypothesis (H1): row and column variables are dependent

# Compute chi-square test in R
chisq <- chisq.test(data)

# R will throw a warning if many of the expected values will are very small (assumtion 4 of chi-square test)
# and therefore the approximations of p may not be right. (see expected counts)

chisq
# printing the p-value
chisq$p.value

# if p < alpha (e.g. 5%) variables are significantly dependent

# Observed counts ( = input)
chisq$observed

# Expected counts (if H0 is true)
round(chisq$expected,2)

# residuals (correlation)
round(chisq$residuals, 3)

# install.packages("corrplot")
library(corrplot)
corrplot(chisq$residuals, is.cor = FALSE)


# Contibution in percentage (%)
contrib <- 100*chisq$residuals^2/chisq$statistic
round(contrib, 3)

# Visualize the contribution
corrplot(contrib, is.cor = FALSE)