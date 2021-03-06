% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/genome_content.R
\name{similarity_by_set}
\alias{similarity_by_set}
\title{Compute genome content similarity by gene set}
\usage{
similarity_by_set(gene_sets1, gene_sets2)
}
\arguments{
\item{gene_sets1}{list of vectors of 1s and 0s which represnet presence and absence of gene families from each of the gene sets in first genome.}

\item{gene_sets2}{list of vectors of 1s and 0s which represnet presence and absence of gene families from each of the gene sets in second genome.}
}
\value{
A data frame with 5 variables: \code{set_ID} gene set identifier, \code{score} genome content similarities computed between
       \code{gene_sets1} and \code{gene_sets2} for each individual gene set, \code{set_size} number of gene families in the gene set,
       \code{in_genome1} number of gene families from gene set present in first and \code{in_genome2} second genomes.
}
\description{
This function calculates genome content similarity index for two genomes gene set by gene set.
}
\examples{
data(families_Bf)
data(families_Er)
sets_Bf = set_representation(families = families_Bf, gene_sets = reference_gene_sets)
sets_Er = set_representation(families = families_Er, gene_sets = reference_gene_sets)
sim_Bf_Er = similarity_by_set(gene_sets1 = sets_Bf, gene_sets2 = sets_Er)
head(sim_Bf_Er)
}
\references{
\enumerate{
           \item Kamneva OK. Genome composition of microbes predicts their co-occurrence in the environment. In review.
         }
}
\seealso{
\code{\link{similarity}}, \code{\link{functional_association}}, \code{\link{set_representation}},
         \code{\link{reference_gene_sets}}.
}

