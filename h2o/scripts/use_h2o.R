suppressPackageStartupMessages(library(h2o))

# package version should match server version
try(h2o.init("h2oai"), silent = TRUE)

# show available data frames on the server
h2o.ls()

# add data
cat("Add data\n")
iris_train <- as.h2o(iris[, 1:4], "iris_train")
iris_validate <- as.h2o(iris, "iris_validate")

# show available data frames on the server
h2o.ls()

# build the model
cat("Build the model\n")
iris_kmeans <- h2o.kmeans(iris_train, k = 3, model_id = "iris_kmeans", init = "Random")

# predict and show result
cat("Predict that\n")
iris_predict <- h2o.predict(iris_kmeans, iris_validate)
res <- as.data.frame(h2o.cbind(iris_validate, iris_predict))
print(res)

