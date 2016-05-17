#' @title Compute genome content similarity index
#' @description This function calculates genome content similarity index for two genomes.
#'
#' @param gene_sets1 list of vectors of 1s and 0s which represnet presence and absence of gene families from each of the gene sets in first genome.
#' @param gene_sets2 list of vectors of 1s and 0s which represnet presence and absence of gene families from each of the gene sets in second genome.
#' @param threshold fraction of gene families from a gene set which is required to be present in
#'        at least one of the genomes for for the gene set to contribute to genome content
#'        similarity index calculation.
#' @return Genome content similarity index computed for two genomes encoding \code{gene_sets1}
#'        and \code{gene_sets2} respectively.
#' @references \enumerate{
#'            \item Kamneva OK. Genome composition of microbes predicts their co-occurrence in the environment. In review.
#'          }
#' @seealso \code{\link{similarity_by_set}}, \code{\link{functional_association}}, \code{\link{set_representation}},
#'          \code{\link{reference_gene_sets}}.
#' @examples
#' data(families_Bf)
#' data(families_Er)
#' sets_Bf = set_representation(families = families_Bf, gene_sets = reference_gene_sets)
#' sets_Er = set_representation(families = families_Er, gene_sets = reference_gene_sets)
#' sim_Bf_Er = similarity(gene_sets1 = sets_Bf, gene_sets2 = sets_Er, threshold = 0.05)
#' sim_Bf_Er
#' @export
similarity <- function(gene_sets1, gene_sets2, threshold = 0.05)
{
  if(class(gene_sets1) != "list" | class(gene_sets2) != "list" | class(threshold) != "numeric" |
     threshold <= 0 | threshold > 1){
    cat("gene_sets1 and gene_sets2 should be lists of vectors of 1s and 0s.\n
        Threshold should be a real value between 0 and 1. See help for more details", "\n", sep="")
  }
  indices = similarity_by_set(gene_sets1, gene_sets2)
  indices = indices[indices[,5] > (indices[,3] * threshold) | indices[,4] > (indices[,3] * threshold),]
  sim_index = mean(indices[, 2])
  return(sim_index)
}

#' @title Compute genome content similarity by gene set
#' @description This function calculates genome content similarity index for two genomes gene set by gene set.
#' @param gene_sets1 list of vectors of 1s and 0s which represnet presence and absence of gene families from each of the gene sets in first genome.
#' @param gene_sets2 list of vectors of 1s and 0s which represnet presence and absence of gene families from each of the gene sets in second genome.
#' @return A data frame with 5 variables: \code{set_ID} gene set identifier, \code{score} genome content similarities computed between
#'        \code{gene_sets1} and \code{gene_sets2} for each individual gene set, \code{set_size} number of gene families in the gene set,
#'        \code{in_genome1} number of gene families from gene set present in first and \code{in_genome2} second genomes.
#' @references \enumerate{
#'            \item Kamneva OK. Genome composition of microbes predicts their co-occurrence in the environment. In review.
#'          }
#' @seealso \code{\link{similarity}}, \code{\link{functional_association}}, \code{\link{set_representation}},
#'          \code{\link{reference_gene_sets}}.
#' @examples
#' data(families_Bf)
#' data(families_Er)
#' sets_Bf = set_representation(families = families_Bf, gene_sets = reference_gene_sets)
#' sets_Er = set_representation(families = families_Er, gene_sets = reference_gene_sets)
#' sim_Bf_Er = similarity_by_set(gene_sets1 = sets_Bf, gene_sets2 = sets_Er)
#' head(sim_Bf_Er)
#' @export
similarity_by_set <- function(gene_sets1, gene_sets2) {
  if(class(gene_sets1) != "list" | class(gene_sets2) != "list"){
    cat("gene_sets1 and gene_sets2 should be lists of vectors of 1s and 0s. See help for more details.", "\n", sep="")
  }
  genes = mapply(cbind, gene_sets1, gene_sets2, SIMPLIFY = FALSE)
  indices = lapply(genes, get_similarity)
  indices = matrix(unlist(indices), ncol = 4, byrow = TRUE)
  indices = cbind(1:length(gene_sets1), indices)
  indices = as.data.frame(indices)
  names(indices) = c("gene_set", "index", "set_size", "in_genome1", "in_genome2")
  return(indices)
}



get_similarity<-function(genes) {
  sim_index = sum(1-abs(genes[,1] - genes[,2]));
  sim_index = sim_index/length(genes[,1])
  indices = c(sim_index,dim(genes)[1], sum(genes[,1]),sum(genes[,2]) )
  return(indices)
}
