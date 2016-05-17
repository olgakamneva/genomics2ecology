#' @title Compute microbe-microbe functional association index
#' @description This function calculates microbe-microbe functional association index for two genomes.
#'
#' @param families1 character vector of gene family names from STRING 10.0 present in first genome.
#' @param families2 character vector of gene family names from STRING 10.0 present in second genome.
#' @param network data frame encoding associations between gene families. Should contain 2 or 3 variables:
#'        \code{node1} gene family one, \code{node2} gene family two,
#'        \code{weight} weight of the edge.
#' @return Microbe-microbe functional association index for two genomes which encode \code{families1} and \code{families1}.
#'        This index represents fraction of edges which connect gene families present in one of the compared genomes to gene families present in another
#'        out of all of the edges in the gene family network encoded by one of the two genomes exclusively.
#'
#' @references \enumerate{
#'            \item Kamneva OK. Genome composition of microbes predicts their co-occurrence in the environment. In review.
#'          }
#' @seealso \code{\link{similarity}}, \code{\link{similarity_by_set}}.
#' @examples
#' data(families_Bf)
#' data(families_Er)
#' association_index = functional_association(families1 = families_Bf, families2 = families_Er, network = reference_network)
#' association_index
#' @export
functional_association <- function(families1, families2, network = reference_network){

  ## For each edge, calculate in which genome first gene family is found.
  links1 = rep("none", dim(network)[1])
  links1[network[, 1] %in% families1 & network[, 1] %in% families2 ] = "b"
  links1[network[, 1] %in% families1 & !network[, 1] %in% families2 ] = "sp1"
  links1[!network[, 1] %in% families1 & network[, 1] %in% families2 ] = "sp2"

  ## For each edge, calculate in which genome second gene family is found.
  links2=rep("none", dim(network)[1])
  links2[network[, 2] %in% families1 & network[, 2] %in% families2 ] = "b"
  links2[network[, 2] %in% families1 & !network[, 2] %in% families2 ] = "sp1"
  links2[!network[, 2] %in% families1 & network[, 2] %in% families2 ] = "sp2"

  ## Count different kinds of edges.
  b_b = length(which(links1 == "b" & links2 == "b"))
  one_one = length(which(links1 == "sp1" & links2 == "sp1"))
  two_two = length(which(links1 == "sp2" & links2 == "sp2"))
  one_b = length(which((links1 == "sp1" & links2 == "b") | (links1 == "b" & links2 == "sp1")))
  two_b = length(which((links1 == "sp2" & links2 == "b") | (links1 == "b" & links2 == "sp2")))
  one_two = length(which((links1 == "sp1" & links2 == "sp2") | (links1 == "sp2" & links2 == "sp1")))

  ## Calculate microbe-microbe functional association index.
  associaton_index = one_two / (one_two + one_one + two_two)
  return(associaton_index)

}
