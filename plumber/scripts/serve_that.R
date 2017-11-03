pr <- plumber::plumb('/endpoints/blogs.R')
pr$run(host = '0.0.0.0', port = 8000, swagger = TRUE)

