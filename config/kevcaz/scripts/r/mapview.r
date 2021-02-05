#!/usr/bin/env -S r -i

#
# Use mapview to visualise a spatial file
#
# Copyright (C) 2020 Kevin Cazelles
#
# Released under GPL (>= 2)

## load docopt package from CRAN
library(docopt)

## configuration for docopt
doc <- "Usage: render.r [-h] [-x] [FILES...]

-h --help            show this help text
-x --usage           show help and short example usage"

opt <- docopt(doc)			# docopt parsing

if (opt$usage) {
    cat(doc, "\n\n")
    cat("Examples:
  mapview.r file1.tif file2.kml    # see spatial files in 

The package littler brings 'r' to the command-line.
See http://dirk.eddelbuettel.com/code/littler.html for more information.\n")
    q("no")
}



## helper function

readSpatial <- function(con, crs = 4326) { 
  # rds 
  if (grepl("\\.[Rr]ds", con)) {
    out <- readRDS(con)
  } else {
    # msgInfo("reading", con)
    out <- read_sf_try(con, crs = crs)
    if (isFALSE(out)) {
      out <- read_stars_try(con, crs = crs)
    }
    # 
    if (isFALSE(out)) {
      msgError("cannot read", con)
      out <- NULL 
    } 
  }
  
  out
}

read_sf_try <- function(con, crs = 4326) {
  out <- tryCatch(sf::st_read(con, quiet = TRUE), error = function(x) FALSE)
  
  if ("sf" %in% class(out) & identical(sf::st_crs(out), sf::st_crs(crs))) {
    out <- sf::st_transform(out, crs = crs)
  }
  
  out   
}

read_stars_try <- function(con, crs = 4326) {
  
  if (grepl("*.ncdf$", tolower(con))) {
    stars::read_ncdf(con)
  } else {
    out <- tryCatch(stars::read_stars(con), error = function(x) FALSE)
    if ("stars" %in% class(out) & identical(sf::st_crs(out), sf::st_crs(crs))) {   
      out <- sf::st_transform(out, crs = crs)
    }
  }
  
  out 
}

sapply(opt$FILES, function(x) {
  print(mapview::mapview(readSpatial(x)))
})

Sys.sleep(1000)
