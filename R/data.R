#' @title Reference gene sets
#' @description Sets of functionally linked gene families identified using MCL clustering of the global network
#'              (\code{reference_network}) of all the gene families identified in STRING 10.0 database.
#' @docType data
#' @references \enumerate{
#'            \item Kamneva OK. Genome composition of microbes predicts their co-occurrence in the environment. In review.
#'          }
#' @format List of character vectors. Each individual vector represents a set of functionally associated gene families (or gene set)
#'        likely involved in the same function or process.
#' @examples data(reference_gene_sets)
"reference_gene_sets"



#' @title Reference gene family network
#' @description Global network of functionally linked gene families extracted from STRING 10.0 database.
#'              Only gene neighbor scores are used as evidence of functional association.
#'              Edges with original score less than 275 were removed, then weights (\eqn{w}) were unit normalized
#'              as follows: \eqn{(w-275)/1000}.
#' @docType data
#' @source STRING 10.0 database \url{http://string-db.org/}.
#' @references \enumerate{
#'            \item Szklarczyk D, Franceschini A, Wyder S, Forslund K, Heller D, Huerta-Cepas J,
#'            Simonovic M, Roth A, Santos A, Tsafou KP, Kuhn M, Bork P, Jensen LJ, von Mering C.
#'            STRING v10: protein-protein interaction networks, integrated over the tree of life.
#'            Nucleic Acids Res. 2015 Jan; 43:D447-52.4.
#'            \item Kamneva OK. Genome composition of microbes predicts their co-occurrence in the environment. In review.
#'          }
#' @format A data frame with 3 variables: \code{node1} gene family one, \code{node2} gene family two,
#'        \code{weight} unit normalized gene neighbor score.
#' @examples data(reference_network)
"reference_network"

#' @title Gene families in \eqn{Bacteroides fragilis} 3_1_12
#' @description List of gene families present in \eqn{Bacteroides fragilis} 3_1_12 as annotated in STRING 10.0.
#' @docType data
#' @source STRING 10.0 database \url{http://string-db.org/}.
#' @references \enumerate{
#'            \item Szklarczyk D, Franceschini A, Wyder S, Forslund K, Heller D, Huerta-Cepas J,
#'            Simonovic M, Roth A, Santos A, Tsafou KP, Kuhn M, Bork P, Jensen LJ, von Mering C.
#'            STRING v10: protein-protein interaction networks, integrated over the tree of life.
#'            Nucleic Acids Res. 2015 Jan; 43:D447-52.4.
#'          }
#' @format A character vector.
#' @examples data(families_Bf)
"families_Bf"

#' @title Gene families in \eqn{Eubacterium rectale} DSM 17629
#' @description List of gene families present in \eqn{Eubacterium rectale} DSM 17629 as annotated in STRING 10.0.
#' @docType data
#' @source STRING 10.0 database \url{http://string-db.org/}.
#' @references \enumerate{
#'            \item Szklarczyk D, Franceschini A, Wyder S, Forslund K, Heller D, Huerta-Cepas J,
#'            Simonovic M, Roth A, Santos A, Tsafou KP, Kuhn M, Bork P, Jensen LJ, von Mering C.
#'            STRING v10: protein-protein interaction networks, integrated over the tree of life.
#'            Nucleic Acids Res. 2015 Jan; 43:D447-52.4.
#'          }
#' @format A character vector.
#' @examples data(families_Er)
"families_Er"

