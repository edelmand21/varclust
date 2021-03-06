% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/auxiliary.functions.R
\name{cluster.BIC}
\alias{cluster.BIC}
\title{BIC for subspace clustering}
\usage{
cluster.BIC(X, segmentation, max.dim, numb.clusters, sigma = NULL,
  estimateJointly = TRUE)
}
\arguments{
\item{X}{a matrix with only continuous variables}

\item{segmentation}{a vector, segmentation for which likelihood is computed. Clusters
numbers should be from range [1, numb.clusters]}

\item{max.dim}{an integer, maximum dimension of subspace. Number of principal components
that span each subspace.}

\item{numb.clusters}{an integer, number of clusters}

\item{sigma}{a numeric, (default is NULL) value of sigma provided by the user}

\item{estimateJointly}{a boolean, (default value is TRUE) indicating if sigma should be estimated jointly for all clusters}
}
\value{
BIC value of BIC criterion
}
\description{
Computes the value of BIC criterion for given data set and partition.
In each cluster we assume that variables are spanned by few factors.
Considering maximum likelihood we get that those factors are in fact
principal components. Noise sigma can be computed jointly for all clusters (default),
seperately for each cluster or be specified as input.
}
\keyword{internal}

