nullToNA <- function(x) {
  x[sapply(x, is.null)] <- NA
  return(x)
}

listToDF <- function(t) {
  do.call(rbind,t) %>%
    dplyr::as_tibble() %>%
    dplyr::mutate_all(~nullToNA(.)) %>%
    tidyr::unnest()
}

