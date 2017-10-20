library(miniCRAN)

pkgs <- c("magrittr", "dplyr")

pkgList <- pkgDep(pkgs, suggests = FALSE)

print(pkgList)

CRAN_mirror <- "https://mran.microsoft.com/snapshot/2017-08-01"

print(CRAN_mirror)

makeRepo(pkgList, path = "/miniCRAN", repos = CRAN_mirror, type=c("source", "win.binary"))

