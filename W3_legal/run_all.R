# Renders the Workshop 3 legal-twins notebook. Run from this folder (or open W3_legal.Rproj).
need <- c("data.table", "jsonlite", "ggplot2", "rmarkdown", "knitr")
miss <- need[!vapply(need, requireNamespace, logical(1), quietly = TRUE)]
if (length(miss)) stop("Install first: install.packages(c(", paste0('"', miss, '"', collapse = ", "), "))")
if (!requireNamespace("httr2", quietly = TRUE)) message("httr2 not installed: the live call in Section 5 will be skipped.")
t0 <- Sys.time()
rmarkdown::render(file.path("notebooks", "01_justice_twins.Rmd"), output_format = "html_document", quiet = TRUE)
cat(sprintf("Rendered 01_justice_twins.html in %.0f s\n", as.numeric(Sys.time() - t0, units = "secs")))
cat("All notebooks rendered\n")
