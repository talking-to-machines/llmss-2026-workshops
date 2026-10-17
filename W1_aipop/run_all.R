#!/usr/bin/env Rscript
# run_all.R — rebuild every Workshop 1 output from scratch.
# Target: under five minutes on a laptop, with no network access.
# Usage:  Rscript run_all.R          (from W1_aipop/)

t0 <- Sys.time()
stopifnot(dir.exists("notebooks"), dir.exists("data"))

need <- c("arrow", "data.table", "ggplot2", "jsonlite", "lme4", "rmarkdown", "knitr")
miss <- need[!vapply(need, requireNamespace, logical(1), quietly = TRUE)]
if (length(miss)) stop("Missing packages: ", paste(miss, collapse = ", "),
                       "\nInstall with: install.packages(c(",
                       paste0('"', miss, '"', collapse = ", "), "))")

nbs <- sort(list.files("notebooks", pattern = "^[0-9]{2}_.*[.]Rmd$", full.names = TRUE))
for (nb in nbs) {
  message("\n=== ", basename(nb), " ===")
  rmarkdown::render(nb, quiet = TRUE, envir = new.env())
}

message(sprintf("\nAll notebooks rendered in %.1f minutes.",
                as.numeric(difftime(Sys.time(), t0, units = "mins"))))
