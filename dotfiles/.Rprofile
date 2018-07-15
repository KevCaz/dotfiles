#### KevCaz's .Rprofile
## To refresh => remove the .RData file otherwise .First is found in there
## or use R --no-restore

##-- Set the RNG
set.seed(1987)

##-- options (explicit enough)
options(
  prompt = "R>> ",
  continue = "+... ",
  width = 160,
  max.print = 2000,
  repos = "https://cran.wu.ac.at/",
  stringsAsFactors = FALSE
)
##-- X11 options
grDevices::X11.options(width=10, height=10)


##-- few useful functions
reset <- function() system('reset')
nautilus <- function(x='.') system(paste0('nautilus ', x))
deco <- function(char = "-", n = 10) paste(rep(char, n), collapse="")

##-- function triggered when starting a new session
.First <- function(){
    cat("\n", paste0(deco("=", n = 28), ">>"), " KevCaz 92 Hijo ",
    paste0("<<", deco("=", n = 28)), "\n >>", date(), " \n\n") ;
}

##-- function triggered when exiting a new session
.Last <- function(){
    graphics.off()
    cat("\n", paste0(deco("~", n = 28), "<") , " Até mais KevCaz! ",
    paste0(">", deco("~", n = 28)),"\n") ;
}
