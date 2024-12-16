library(tidyverse)

#' Download Street Tree Data from a Specified URL
#'
#' This function downloads street tree data from a given URL and saves it to a specified output file.
#'
#' @param url A string specifying the URL from which to download the data.
#' @param output_file A string specifying the path to save the downloaded file.
#'
#' @return This function does not return an object but saves the downloaded file locally.
#' @examples
#' download_data("https://example.com/tree_data.csv", "tree_data.csv")
#' @export
download_data <- function(url, output_file) {
  # Validate inputs
  tryCatch({
    download.file(url, destfile = output_file, method = "auto")
  }, error = function(e) {
    stop("Error in downloading file: ", e$message)
  })

  message("Data downloaded successfully.")
}
