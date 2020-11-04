# #### KevCaz's .Rprofile
# 
# 
# ##-- options (explicit enough)
options(
  prompt = "R> ",
  continue = "+... ",
  width = 80,
  max.print = 2400,
  repos = "https://cran.wu.ac.at/",
  # stringsAsFactors = FALSE
  bookdown.render.file_scope = FALSE
)
##-- X11 options
grDevices::X11.options(width = 10, height = 10)

##-- libpaths
# .libPaths("/home/kevcaz/R/x86_64-pc-linux-gnu-library/3.5")

options(usethis.full_name = "Kevin Cazelles")

##-- few useful functions
clr <- function() system('clear')
reset <- function() system('reset')
#
getCit <- function(x)
  cat(toBibtex(citation(x)), file = paste0(x, '.bib'), sep = "\n")
#
sqBloc <- function(i, sz) (i-1)*sz + seq_len(sz)
#
notCran <- function(not_cran) Sys.setenv(NOT_CRAN = not_cran)
#
pch_demo <- function(n = 25) {
  sq <- seq_len(n)
  plot(sq, pch = sq)
  text(sq, sq, labels = sq, pos = 3)
}

#-- development packages
devel <- function() {
  lapply(
    list("devtools", "testthat", "usethis", "goodpractice", "microbenchmark",
    "pkgdown", "rhub"),
      require, character.only = TRUE)
  cat("\n", crayon::green("packages loaded\n"))
  invisible(NULL)
}
##
dl <- function() {
  devel()
  devtools::load_all();
}
ld <- function() {
  devtools::load_all()
  devtools::document()
}
ldl <- function() {
  ld()
  devtools::load_all()
}
ldt <- function() {
  ld()
  devtools::test()
}
ldc <-  function() {
  ld()
  devtools::check()
}
# Mapview shortcut
mpv <- mapview::mapview
# head shortcut
h <- utils::head
# names
nm <- base::names

# convert doc 
rmd <- function(x) rmarkdown::render(x, "all")

# Update only packages found in R_LIBS_USER
myupdate <- function() update.packages(Sys.getenv("R_LIBS_USER"), ask = FALSE)

##-- data science packages
dasci <- function() {
  lapply(
    list("tidyverse", "magrittr", "sf", "raster", "graphicsutils"), require,
      character.only = TRUE)
  cat("\n", crayon::green("packages loaded\n"))
  invisible(NULL)
}

# convert units
conv <- function(x, from = "fahrenheit", to = "celsius") {
  units::as_units(0, to) +
  units::as_units(as.numeric(x), from)
}

# get package citation as files
get_pkg_bib <- function(pkg) {
    cat(toBibtex(citation(pkg)), file = paste0(pkg, ".bib"), sep = "\n") 
}

# get my pubs
mypubs <- function(orcid = "0000-0001-6619-9874",
  filename = "~/Github/Others/CV_latex/pubs.bib", rm = TRUE) {
  my_dois <- unique(rorcid::identifiers(rorcid::works(orcid)))
  pubs <- rcrossref::cr_cn(dois = my_dois, format = "bibtex")
  if (rm) file.remove(filename)
  invisible(lapply(pubs, write, filename, append = TRUE))
}

# Torrent
easy_torrent <- function(x, mx = 20, path = "~/Downloads") {
  df <- omdbr::find_imdb_id(search = x, n_max = mx)
  print(df)
  id <- as.numeric(readline("Select an id (i.e. a row): "))
  omdbr:::get_torrent(df$imdbid[id], path = path, open = TRUE)
  invisible(NULL)
}

# # Add beer
# add_microbrew <- function(name, pos, address) {
#   list(
#
#   )
# }


## Function triggered when starting a new session
## No need for .first() function
## See https://github.com/eddelbuettel/littler/issues/24
# local({
#   cat("\n", crayon::green(">> KevCaz"), " -",
#   crayon::yellow(format(Sys.time(), '%d/%m/%y %Hh%Mmin%Ssec')), "\n\n") ;
# })

##-- function triggered when exiting a new session
# .Last <- function(){
#     graphics.off()
#     cat("\n ",
#     crayon::yellow(format(Sys.time(), '%d/%m/%y %Hh%Mmin%Ssec')),
#     crayon::red("Até mais! <<"), "\n")
# }
