# pkg2date.R
# script to update packages
# last update: 2017-05-12
# Kevin Cazelles

args <- commandArgs(trailingOnly = TRUE)
tmp <- as.numeric(args[1L])

## update README / documentation
ndc <- 60
decoreq <- function(nb) paste(rep("=",nb), collapse="")
decor <- function(){
  cat("DONE", decoreq(ndc), "\n")
}

##
cat(decoreq(.5*ndc-2), " START ", decoreq(.5*ndc-2), "\n\n")


if (!tmp) {
  ##
  devtools::load_all(".")
  rmarkdown::render("README.Rmd", "all", quiet=TRUE)
  ##
  cat(decoreq(.5*ndc-7), " README UPDATED ", decoreq(.5*ndc-6), "\n\n")
} else {
  ## format the code
  cat("##-- tidying ........\n")
  formatR::tidy_dir("./R")
  formatR::tidy_dir("./tests/test_that")
  decor()
  ## load the package
  cat("##-- loading ........\n")
  devtools::load_all(".")
  decor()
  ## document the package
  cat("##-- documenting ....\n")
  devtools::document(".")
  decor()
  ## testing the code
  if (dir.exists("tests")){
    cat("##-- testing ........\n")
    devtools::test()
    decor()
  }
  ## building the vgnettes
  if (tmp>1 & dir.exists("vignettes")){
    cat("##-- vignettes ......\n")
    devtools::build_vignettes(".")
  }
}

ndc <- 60
decoreq <- function(nb) paste(rep("=",nb), collapse="")
cat(decoreq(.5*ndc-1), " END ", decoreq(.5*ndc-1), "\n\n")
