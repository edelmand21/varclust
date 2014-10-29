% Generated by roxygen2 (4.0.2): do not edit by hand
\name{mlcc.reps}
\alias{mlcc.reps}
\title{Subspace clustering assuming that the number of clusters is known}
\usage{
mlcc.reps(X, numb.clusters = 2, numb.runs = 20, stop.criterion = 1,
  max.iter = 20, initial.segmentations = NULL, max.dim = 2, scale = T,
  numb.cores = NULL)
}
\arguments{
\item{X}{a data frame or a matrix with only continuous variables}

\item{numb.clusters}{an integer, number of cluster}

\item{numb.runs}{an integer, number of runs of \code{\link{mlcc.kmeans} algorithm} with random initialization}

\item{stop.criterion}{an integer, indicating how many changes in partitions triggers stopping the \code{\link{mlcc.kmeans} algorithm}}

\item{max.iter}{an integer, maximum number of iterations of \code{\link{mlcc.kmeans} algorithm}}

\item{initial.segmentations}{a list of vectors, segmentations that user wants to be used as an initial segmentation in \code{\link{mlcc.kmeans} algorithm}}

\item{max.dim}{an integer, maximum dimension of subspaces to be considered}

\item{scale}{a boolean, if TRUE (value set by default) then data are scaled to unit variance}

\item{numb.cores}{an integer, number of cores to be used, by default all cores are used}
}
\value{
A list consisting of
\item{segmentation}{a vector containing the partition of the variables}
\item{BIC}{double, value of \code{\link{cluster.BIC}} criterion}
}
\description{
For a fixed number of cluster and fixed number of components per cluster
function returns the best partition and basis for each subspace.
}
\details{
In more detail, an algorithm \code{\link{mlcc.kmeans}}
is run a \emph{numb.runs} of times with random initializations.
The best partition is selected according to the BIC.
}
\examples{
\donttest{
data <- dataSIMULATION(n=100, SNR=1, K=5, numbVars=30, max.dim=2)
mlcc.reps(data$X, numb.clusters=5, numb.runs=20)}
}
