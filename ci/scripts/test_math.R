test_that("add", {
  # given
  a <- 4
  b <- 5
  # when
  res <- add(a, b)
  # then
  expeceted_res <- 9
  expect_equal(res, expeceted_res)
})

test_that("sub", {
  # given
  a <- 4
  b <- 5
  # when
  res <- sub(a, b)
  # then
  expeceted_res <- -1
  expect_equal(res, expeceted_res)
})

