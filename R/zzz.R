#' Generative artwork
#'
#' @param dir Directory to write file to
#' @param ... Other arguments
#' @name rosemary


check_dir <- function(dir) {
  if(is.null(dir)) {
    dir <- getOption("rosemary.images")
  }
  if(is.null(dir)) {
    stop("`dir` must be specified", call. = FALSE)
  }
  dir <- normalizePath(dir)
  return(dir)
}