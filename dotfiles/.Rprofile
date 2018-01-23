#### My .Rprofile
#### In .Renviron => variable R_PROFILE_USER = "path/.Renviron" indicates the location of this file:
#### To refresh => remove the .RData file otherwise .First is found in there
#### or use R --no-restore

##-- For random number
set.seed(1987)

##-- R interactive prompt
options(prompt="R>> ")
options(continue="+... ")
options(width = 160)
options(repos="https://cran.wu.ac.at/")
options(stringsAsFactors=FALSE)
options(defaultPackages=c(
    getOption("defaultPackages"),
    "knitr",
    "rmarkdown",
    "magrittr",
    "graphicsutils",
    "devtools",
    "letiRmisc"
    ))
##-- X11 options 
grDevices::X11.options(width=10, height=10)


##-- few useful function
reset <- function() system('reset')
nautilus <- function(x='.') system(paste0('nautilus ', x))

##-- function triggered when starting a new session
.First <- function(){
    cat("\n", paste(rep("=",30), collapse=""), " KevCaz 92 Hijo ",
    paste(rep("=",24), collapse=""), "\n >>", date(), " \n\n") ;
}

##-- function triggered when exiting a new session
.Last <- function(){
    graphics.off()
    cat("\n",paste(rep("=",28), collapse="") , "Até mais KevCaz!",
    paste(rep("=",28), collapse=""),"\n") ;
}
