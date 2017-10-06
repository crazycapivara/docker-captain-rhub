library(base64enc)

#* @get /plot_that
#* @png
plot_that <- function() {
  x <- seq(1, 10, 0.1)
  y <- sin(x)
  plot(x, y, type = "l")
}

#* @get /plot_base64
plot_base64 <- function() {
  x <- seq(1, 10, 0.1)
  y <- sin(x)
  tmp <- tempfile()
  png(tmp)
  plot(x, y, type = "l")
  dev.off()
  paste("data:image/png;base64,", base64encode(tmp))
}

