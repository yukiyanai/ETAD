#' @title Export ETAD data as a TSV file
#' @description \code{export_ETAD_tsv} exports a tab-separated-values file
#'   of the ETAD dataset.
#' @param file either a character string naming a file or a connection open for
#'   writing.
#' @seealso \code{\link{export_ETAD_csv}}, \code{\link{export_ETAD_dta}},
#'   \code{\link[utils]{write.table}}
#' @export
export_ETAD_tsv <- function(file) {
  if (is.null(file)) {
    file <- file.path(getwd(), "ETAD.tsv")
  }
  utils::write.table(ETAD::ETAD, file = file, row.names = FALSE)
}
