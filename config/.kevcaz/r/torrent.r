easy_torrent <- function(x, mx = 20, path = "~/Downloads") {
  df <- omdbr::find_imdb_id(search = x, n_max = mx)
  print(df)
  id <- as.numeric(readline("Select an id (i.e. a row): "))
  omdbr:::get_torrent(df$imdbid[id], path = path, open = TRUE)
  invisible(NULL)
}