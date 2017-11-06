library(mongolite)

conn <- mongo("bender", db = "fry", url="mongodb://mongodb")
print(conn)
conn$insert(iris)
print(conn$count())
print(conn$find())

