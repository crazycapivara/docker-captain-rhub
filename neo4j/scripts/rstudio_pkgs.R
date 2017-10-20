library(RNeo4j)

## --- some helpers
add_relation <- function(x, y, relation) {
  from_node <- getOrCreateNode(graph, "rpackage", name = x)
  to_node <- getOrCreateNode(graph, "rpackage", name = y)
  createRel(from_node, relation, to_node)
}

add_pkg_deps <- function(pkg, deps, relation) {
  for (dep in deps) {
    add_relation(pkg, dep, relation)
    cat(sprintf("Added (%s) -[:%s]-> (%s)\n", pkg, relation, dep))
  }
}

## --- config
rstudio_pkgs <- c("magrittr", "tidyverse", "shiny", "rmarkdown",
             "ggplot2", "knitr", "tidyr", "readr", "readxl", "dplyr", "stringr")
relations <- c("Imports", "Suggests")
deps <- lapply(relations, function(relation) {
  tools::package_dependencies(rstudio_pkgs, which = relation)
})

## --- setup graph
graph <- RNeo4j::startGraph("neo4j:7474/db/data", "neo4j", "bender")
clear(graph, FALSE)
addConstraint(graph, "rpackage", "name")
cat("graph initialized\n")

## --- main loop
for (i in 1:length(relations)) {
  for (pkg in rstudio_pkgs) {
    add_pkg_deps(pkg, deps[[i]][[pkg]], toupper(relations[i]))
  }
}
cat("done\n")

cat("Test db\n")
argv <- commandArgs(TRUE)

dep <- ifelse(!is.na(argv[1]), argv[1], "jsonlite")
query <- sprintf('MATCH (n) -[:IMPORTS]-> (dep {name: "%s"}) RETURN n.name AS pkg, "imports" AS relation, dep.name AS dep', dep)
res <- cypher(graph, query)
print(res)

pkg <- ifelse(!is.na(argv[2]), argv[2], "readxl")
query <- sprintf('MATCH (pkg {name: "%s"}) -[r]-> (n) RETURN pkg.name AS pkg, type(r) AS rel, n.name AS dep', pkg)
res <- cypher(graph, query)
print(res)

