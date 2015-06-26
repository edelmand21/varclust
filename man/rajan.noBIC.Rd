% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/auxiliary.functions.R
\name{rajan.noBIC}
\alias{rajan.noBIC}
\title{Version of BIC for PCA according ro Rajan, Rayner model}
\usage{
rajan.noBIC(X, k)
}
\arguments{
\item{X}{a matrix with only continuous variables}

\item{k}{number of principal components fitted}
}
\value{
BIC value of BIC criterion
}
\description{
Computes the value of BIC criterion for given data set and
number of factors.
}
\references{
Automatic choice of dimensionality for PCA, Thomas P. Minka
}
\keyword{internal}
