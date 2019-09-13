#' Find DC Location
#'
#' Uses DC's [`Master Address Repository (MAR)`](https://dcatlas.dcgis.dc.gov/mar/) to find a DC-based
#' location. It returns a table of all possible matching
#' addresses based on the provided string.
#'
#' @md
#' @param string address string
#' @return tibble
#' @export
#' @examples
#' find_location(string = "1600 Pennsylvania Ave NW")
find_location <- function(string){
  resp <- httr::GET("http://citizenatlas.dc.gov/newwebservices/locationverifier.asmx/findLocation2",
                    query = list(str = string, f = "json"))
  httr::stop_for_status(resp)
  cont <- httr::content(resp, as = "parsed")
  t <- cont$returnDataset$Table1
  if(is.null(t)){stop("No Results Found")}
  df <- listToDF(t)
  df
}
