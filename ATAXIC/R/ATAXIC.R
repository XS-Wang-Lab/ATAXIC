#' @title ATAXIC
#'
#' @description
#' \code{ATAXIC} An algorithm  to quantify transcriptomic perturbation heterogeneity in single cancer cells.
#'
#' @details
#' This function calculates the transcriptomic perturbation heterogeneity score in single cancer cells based on the standard deviations of the absolute z-scored gene expression values for tens of thousands of genes.
#' @param input_data_exp A dataframe or matrix containing gene expression profiles in single cancer cells, in which the row name is the gene symbol or Entrez gene ID and the column name is the sample ID of singel cancer cells.
#' @export
#' @return A dataframe with 2 columns:
#' \item{cell}{Tumor cell to be calculated.}
#' \item{ATAXIC_score}{The ATAXIC score of each cell.}
#' @author Qian Liu <qian.liu@stu.cpu.edu.cn>, Xiaosheng Wang <xiaosheng.wang@cpu.edu.cn>, Qiqi Lu <3320092074@cpu.edu.cn>
#' @examples
#' path <- system.file("extdata", "example_ATAXIC.txt", package = "ATAXIC", mustWork = TRUE)
#' input_data_met <- as.matrix(read.table(path, stringsAsFactors = FALSE, sep = "\t", header = TRUE, quote = "", row.names = 1))
#' ATAXIC(input_data_exp)
ATAXIC <- function (input_data_exp) {
  library(matrixStats)

  # Check arguments ------------------------------------------------------------
  if (missing(input_data_exp) || !class(input_data_exp) %in% c("matrix", "data.frame"))
    stop("'input_data_exp' is missing or incorrect")

  input_data_exp_adjust <- abs((input_data_exp - rowMeans(input_data_exp)))/rowSds(input_data_exp)
  ATAXIC0 <- apply(input_data_exp_adjust, 2, sd, na.rm = TRUE)
  ATAXIC <- data.frame(Sample = names(ATAXIC0), ATAXIC_score = ATAXIC0, row.names = NULL)
  return(ATAXIC)
}
