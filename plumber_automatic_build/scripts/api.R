#' Get dataset
#' @get /dataset/<name>
get_dataset <- function(name, limit = Inf) {
  df <- get(name)
  if (!is.data.frame(df)) {
    return(data.frame(x = "rocket", y = "science"))
  }
  head(df, as.numeric(limit))
}

