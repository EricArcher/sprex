#' @title Create Vector of Species Frequencies
#' @description Create vector of species frequencies from vector of sample frequencies.
#' 
#' @param x a vector where \code{x[i]} is of the number of samples in the \code{i}-th species.
#' 
#' @return a vector(\code{f}) of species frequencies where \code{f[i]} is the number of species
#'   represented by only \code{i} samples.
#' 
#' @author Eric Archer \email{eric.archer@@noaa.gov} 
#' 
#' @seealso species.to.sample.freq
#' 
#' @examples
#' x <- sample(1:100, 30, rep = TRUE)
#' f <- sample.to.species.freq(x)
#' print(x)
#' print(f)
#' 
#' @export

sample.to.species.freq <- function(x) {
  x.df <- as.data.frame(table(x), stringsAsFactors = FALSE)
  x.df[, 1] <- as.numeric(as.character(x.df[, 1]))
  x.df <- x.df[x.df[, 1] > 0, ]
  rownames(x.df) <- NULL
  expand.freqs(x.df)
}
