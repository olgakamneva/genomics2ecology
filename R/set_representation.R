#' @title Calculate gene set representation
#' @description This function calculates presence and absence of gene families in each of the reference gene set in a genome from
#'              the list of gene family encoded in that genome.
#' @param families character vector of gene family names from STRING 10.0 present in first genome.
#' @param gene_sets list of character vectors. Each individual vector represents a set of functionally associated gene families (or gene set)
#'        likely involved in the same function or process.
#' @return Microbe-microbe functional association index for two genomes which encode \code{families1} and \code{families1}.
#' @references \enumerate{
#'            \item Kamneva OK. Genome composition of microbes predicts their co-occurrence in the environment. In review.
#'          }
#' @seealso \code{\link{similarity}}, \code{\link{similarity_by_set}}.
#' @examples
#' data(families_Bf)
#' sets_Bf = set_representation(families = families_Bf, gene_sets = reference_gene_sets)
#' @export
set_representation <- function(families, gene_sets = reference_gene_sets){
  genomes_sets=lapply(gene_sets, function(x) as.numeric(x %in% families))
  return(genomes_sets)
}
