#' @title Export ETAD data as a CSV file
#' @description \code{export_ETAD_csv} exports a comma-separated-values file
#'   of the ETAD dataset.
#' @param file either a character string naming a file or a connection open for
#'   writing.
#' @seealso \code{\link{export_ETAD_tsv}}, \code{\link{export_ETAD_dta}},
#'   \code{\link[utils]{write.csv}}
#' @export
export_ETAD_csv <- function(file) {
    if (is.null(file)) {
    file <- file.path(getwd(), "ETAD.csv")
  }
  utils::write.csv(ETAD::ETAD, file = file, row.names = FALSE)
}
