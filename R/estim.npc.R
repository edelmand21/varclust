#' Automatic estimation of number of principal components in PCA
#' 
#' Underlying assumption is that only small number of principal components, associated with largest singular values, 
#' is relevent, while the rest of them is noise. For a given numeric data set, function estimates the number of PCs according to 
#' penalized likelihood criterion. Function adjusts the model used to the case when number of variables is larger
#' than the number of observations.
#' 
#' Please note that no categorical variables and missing values are allowed.
#' 
#' 
#' @param X a data frame or a matrix contatining only continuous variables
#' @param npc.min minimal number of principal components, for all the possible number of
#' PCs between npc.min and npc.max criterion is computed
#' @param npc.max maximal number of principal components, if greater than dimensions of X,
#' min(ncol(X), nrow(X))-1 is used, for all the possible number of
#' PCs between npc.min and npc.max criterion is computed
#' @param scale a boolean, if TRUE (default value) then data is scaled before applying
#' criterion
#' @param verbose a boolean, if TRUE plot with BIC values for different
#'        numbers of components is produced (default value is FALSE)
#' @export
#' @return number of components
#' @examples
#' \dontrun{
#' library(MetabolAnalyze)
#' data(UrineSpectra)
#' estim.npc(UrineSpectra[[1]], verbose=TRUE)}
estim.npc <- function(X, npc.min = 0, npc.max = 10, scale = TRUE, verbose = FALSE){
  # preprocessing on X
  # number of components must be smaller than dimensions of X
  n <- nrow(X)
  p <- ncol(X)
  npc.max <- min(npc.max, min(n,p)-1)
  npc.min <- max(npc.min, 0)
  
  if(class(X) == "data.frame"){
    X <- as.matrix(X)
  }
  
  if(sum(sapply(X, is.numeric)) < p){
    stop("All the variables have to be numeric")
  }
  
  missing <- which(is.na(X))
  if(length(missing) !=  0){
    stop("There are missing values")
  }
  
  if(scale)
    X <- scale(X)
  
  # choosing the method to use accordingly to the dimensions of X
  method <- if(n>p){
    "Penalized likelihood, random factors model"
    } else "Penalized likelihood, random coefficients model"
  
  vals <- switch(method,
                 "Penalized likelihood, random coefficients model" = sapply(npc.min:npc.max, function(j) pca.new.BIC(X, j)),
                 "Penalized likelihood, random factors model" = sapply(npc.min:npc.max, function(j) pca.BIC(X, j)))
  if(verbose){
    caption <- paste0("Criterion:\n", method)
    plot(npc.min:npc.max, vals, xlab = "Number of components", ylab = "Criterion value",
         main = caption, type = "b")
    points(npc.min-1+which.max(vals), max(vals), col = "red")
  }
  npc.min-1+which.max(vals)
}
