# Renders the Silicon Voters notebook to HTML. Run from anywhere:
#   Rscript W3_audience/run_all.R
need <- c("data.table", "jsonlite", "ggplot2", "httr2", "rmarkdown", "knitr")
miss <- need[!vapply(need, requireNamespace, logical(1), quietly = TRUE)]
if (length(miss)) stop("install first: ", paste(miss, collapse = ", "))
if (!requireNamespace("arrow", quietly = TRUE) && !requireNamespace("nanoparquet", quietly = TRUE))
  stop("install arrow (preferred) or nanoparquet to read the panel file")
here <- tryCatch(dirname(normalizePath(sub("--file=", "", grep("--file=", commandArgs(), value = TRUE)[1]))),
                 error = function(e) getwd())
nb <- file.path(here, "notebooks", "02_silicon_voters.Rmd")
rmarkdown::render(nb, output_format = "html_document", envir = new.env())
cat("rendered:", sub("\\.Rmd$", ".html", nb), "\n")
