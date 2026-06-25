#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @importFrom tibble tibble
#' @importFrom utils packageVersion
## usethis namespace: end
NULL

.onAttach <- function(libname, pkgname) {
  tryCatch({
    old_timeout <- getOption("timeout")
    on.exit(options(timeout = old_timeout), add = TRUE)
    options(timeout = 5)
    con <- url("https://cran.r-project.org/web/packages/refugees/DESCRIPTION")
    on.exit(try(close(con), silent = TRUE), add = TRUE)
    desc <- readLines(con, warn = FALSE)
    cran_ver <- package_version(
      trimws(sub("Version:", "", grep("^Version:", desc, value = TRUE)))
    )
    if (cran_ver > packageVersion("refugees")) {
      packageStartupMessage(
        "A newer version of refugees (", cran_ver, ") is available with updated data.\n",
        "Update with: install.packages(\"refugees\")"
      )
    }
  }, error = function(e) invisible(NULL),
     warning = function(w) invisible(NULL))
}
