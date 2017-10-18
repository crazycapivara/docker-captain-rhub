library(testthat)

source("math.R")

res <- test_dir(".", reporter = "tap")
print(res)

