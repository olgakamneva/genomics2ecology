% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{reference_network}
\alias{reference_network}
\title{Reference gene family network}
\format{A data frame with 3 variables: \code{node1} gene family one, \code{node2} gene family two,
       \code{weight} unit normalized gene neighbor score.}
\source{
STRING 10.0 database \url{http://string-db.org/}.
}
\usage{
reference_network
}
\description{
Global network of functionally linked gene families extracted from STRING 10.0 database.
             Only gene neighbor scores are used as evidence of functional association.
             Edges with original score less than 275 were removed, then weights (\eqn{w}) were unit normalized
             as follows: \eqn{(w-275)/1000}.
}
\examples{
data(reference_network)
}
\references{
\enumerate{
           \item Szklarczyk D, Franceschini A, Wyder S, Forslund K, Heller D, Huerta-Cepas J,
           Simonovic M, Roth A, Santos A, Tsafou KP, Kuhn M, Bork P, Jensen LJ, von Mering C.
           STRING v10: protein-protein interaction networks, integrated over the tree of life.
           Nucleic Acids Res. 2015 Jan; 43:D447-52.4.
           \item Kamneva OK. Genome composition of microbes predicts their co-occurrence in the environment. In review.
         }
}
\keyword{datasets}

