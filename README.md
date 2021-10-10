# ATAXIC
An algorithm  to quantify transcriptomic perturbation heterogeneity in single cancer cells.

## Description
The package is used to calculate the transcriptomic perturbation heterogeneity score in single cancer cells based on the standard deviations of the absolute z-scored gene expression values for tens of thousands of genes.

## Installation
You can install the released version of **ATAXIC** with:
```r
if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
devtools::install_github("XS-Wang-Lab/ATAXIC/ATAXIC")
```

## Examples
```r
library(ATAXIC)
path <- system.file("extdata", "example_AXATIC.txt", package = "ATAXIC", mustWork = TRUE)
input_data_exp <- as.matrix(read.table(path, stringsAsFactors = FALSE, sep = "\t", header = TRUE, quote = "", row.names = 1))
ATAXIC(input_data_exp)
