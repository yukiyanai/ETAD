#' @title Download ETAD data in TSV format
#' @description \code{download_ETAD_tsv} downloads a tab-separated-values file
#'   of the ETAD dataset.
#' @param file either a character string naming a file or a connection open for
#'   writing.
#' @seealso \code{\link{download_ETAD_csv}}, \code{\link{download_ETAD_dta}},
#'   \code{\link[utils]{write.table}}
#' @export
download_ETAD_tsv <- function(file) {
  if (is.null(file)) {
    file <- file.path(getwd(), "ETAD.tsv")
  }
  utils::write.table(ETAD::ETAD, file = file, row.names = FALSE)
}
