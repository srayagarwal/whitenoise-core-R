# Title     : value buffering
# Objective : serialization/deserialization between R and proto objects
# Created by: Consequences of Data
# Created on: 2020-04-20

#' @export
serialize_privacy_usage <- function(usage) {
  if (is.na(usage)) {
    return(list())
  }
}
