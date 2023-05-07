#' @title Download ETAD data in Stata dta format
#' @description \code{download_ETAD_dta} downloads a Stata dta file of
#'   the ETAD dataset.
#' @param file either a character string naming a file or a connection open for
#'   writing.
#' @param version file version to use. Supports versions 8-15. Default to 14.
#' @seealso \code{\link{download_ETAD_csv}}, \code{\link{download_ETAD_tsv}},
#'   \code{\link[haven]{write_dta}}
#' @export
download_ETAD_dta <- function(file, version = 14) {
  if (is.null(file)) {
    file <- file.path(getwd(), "ETAD.dta")
  }
  haven::write_dta(ETAD::ETAD, file = file, version = version)
}
