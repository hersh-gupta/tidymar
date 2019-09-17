#' Find DC Location
#'
#' Uses DC's [`Master Address Repository (MAR)`](https://dcatlas.dcgis.dc.gov/mar/) to find a DC-based
#' location. It returns a table of all possible matching
#' addresses based on the provided string.
#'
#' @md
#' @param address address string or vector of addresses
#' @return tibble
#' @examples
#' \dontrun{
#' find_location(address = '1600 Pennsylvania Ave NW')
#' }
#'
#' @export
#' @importFrom RCurl base64
#' @importFrom dplyr '%>%' bind_rows
#' @importFrom tidyr gather unite
#' @importFrom purrr map reduce flatten is_empty pluck

find_location <- function(address) {
    resp <- httr::POST("https://citizenatlas.dc.gov/newwebservices/locationverifier.asmx/findLocationBatch2", body = list(addr_base64 = chunk_parse(address),
        addr_separator = "$", chunkSequnce_separator = "!", f = "json"), encode = "json")
    httr::stop_for_status(resp)
    cont <- httr::content(resp, as = "parsed")
    t <- purrr::map(cont[-1], "returnDataset") %>% purrr::flatten() %>% purrr::flatten()
    if (is.null(t) | purrr::is_empty(t)) {
        stop("No Results Found")
    }
    df <- purrr::map(t, unlist) %>% purrr::map(dplyr::bind_rows) %>% purrr::reduce(dplyr::bind_rows)
    df
}
