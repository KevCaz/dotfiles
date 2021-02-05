#!/usr/bin/env r
#
# Use Rcade to procrastinate

## configuration for docopt
doc <- "Usage: gamer.r [-h] [-x] [-l] [GAME_ID]

-h --help            show this help text
-x --usage           show help and short example usage
-l --list            list games available"

opt <- docopt::docopt(doc)			# docopt parsing

if (opt$usage) {
    cat(doc, "\n\n")
    cat("Examples:
    gamer.r 1 # play 2048

littler which brings 'r' to the command-line.
See http://dirk.eddelbuettel.com/code/littler.html for more information.\n")
    q("no")
}

if (opt$list) {
    nms <- c("none", names(Rcade::games))
    cat("Games available:",
        paste(seq_along(nms), ":", nms),
        sep = "\n")
    q("no")
}

print(Rcade::games[[as.numeric(opt$GAME_ID)]])