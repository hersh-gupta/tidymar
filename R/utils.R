chunk_parse <- function(x) {
    chunks <- ceiling(length(x)/100)
    if (chunks > 1) {
        chunked <- split(x, cut(seq_along(x), ceiling(length(x)/100), labels = FALSE))
        lapply(chunked, function(x) paste("!", do.call("paste", c(sep = " $ ", as.list(x))))) %>% paste0(collapse = "") %>%
            RCurl::base64() %>% purrr::pluck(1)
    } else {
        paste("!", do.call("paste", c(sep = " $ ", as.list(x)))) %>% RCurl::base64() %>% purrr::pluck(1)
    }
}

