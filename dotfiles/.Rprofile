#### KevCaz's .Rprofile
## To refresh => remove the .RData file otherwise .First is found in there
## or use R --no-restore

##-- Set the RNG
set.seed(7891)

##-- options (explicit enough)
options(
  prompt = "R> ",
  continue = "+... ",
  width = 140,
  max.print = 2000,
  repos = "https://cran.wu.ac.at/",
  stringsAsFactors = FALSE
)
##-- X11 options
grDevices::X11.options(width=10, height=10)

##
.libPaths("/home/kevcaz/R/x86_64-pc-linux-gnu-library/3.5")

##-- few useful functions
reset <- function() system('reset')

##-- function triggered when starting a new session
.First <- function(){
	cat("\n", crayon::yellow(">> "), crayon::green("KevCaz"), " -",
  crayon::yellow(format(Sys.time(), '%d/%m/%y %Hh%Mmin')), "\n\n") ;
}

##-- function triggered when exiting a new session
.Last <- function(){
    graphics.off()
    cat("\n ", crayon::red("Até mais KevCaz!"), crayon::yellow(" <<"), "\n")
}
