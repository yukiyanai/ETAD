#' @title Download ETAD data in CSV format
#' @description \code{download_ETAD_csv} downloads a comma-separated-values file
#'   of the ETAD dataset.
#' @param file either a character string naming a file or a connection open for
#'   writing.
#' @seealso \code{\link{download_ETAD_tsv}}, \code{\link{download_ETAD_dta}},
#'   \code{\link[utils]{write.csv}}
#' @export
download_ETAD_csv <- function(file) {
    if (is.null(file)) {
    file <- file.path(getwd(), "ETAD.csv")
  }
  utils::write.csv(ETAD::ETAD, file = file, row.names = FALSE)
}
