% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/auxiliary.functions.R
\name{getSigma}
\alias{getSigma}
\title{Computing joint sigma for all clusters}
\usage{
getSigma(X, segmentation, max.dim, n, p, numb.clusters)
}
\arguments{
\item{X}{data}

\item{segmentation}{variable segmentation}

\item{max.dim}{maximal subspace dimension}

\item{n}{number of rows}

\item{p}{number of variables}

\item{numb.clusters}{total number of clusters}
}
\value{
unbiased noise estimator
}
\description{
Computes unbiased noise estimator under assumption that
all subspaces are of the same dimension
}
\keyword{internal}

