#' @title Number of Samples Required
#' @description Calculate the number of samples to required to observe a 
#'   given proportion of the total number of species.
#' 
#' @param g propotion of total number of species.
#' @param f a vector of species frequencies where \code{f[i]} is the number of 
#'   species represented by only \code{i} samples.
#' @param f0.func a function that computes the number of unobserved 
#'   species (f0).
#' 
#' @return a vector containing of the estimated number of samples 
#'   (\code{m.g}) required to observe \code{g} percent of the total number 
#'   of species.
#' 
#' @author Eric Archer \email{eric.archer@@noaa.gov} 
#' 
#' @references Eqn 11 in Colwell, R.K., A. Chao, N.J. Gotelli, S.-Y. Lin, 
#'   C.X. Mao, R.L. Chazdon, and J.T. Longino. 2012. Models and estimators 
#'   linking individual-based and sample-based rarefaction, extrapolation and 
#'   comparison of assemblages. Journal of Plant Ecology 5(1):3-21.
#'  
#' @examples
#' data(osa.old.growth)
#' f <- expand.freqs(osa.old.growth)
#' num.samples.required(0.6, f = f, f0.func = Chao1)
#' 
#' @export

num.samples.required <- function(g, f, f0.func) {
  x <- f0.func(f)
  s.est <- unname(x["s.est"])
  s.obs <- unname(x["s.obs"])
  
  # calculate additional m individuals required to detect g proportion of 
  #   s.est (Eqn. 11)
  m.g <- if(g > (s.obs / s.est) & g < 1) {
    term.1 <- (x["n"] * f[1]) / (2 * f[2])
    term.2 <- x["f0"] / ((1 - g) * s.est)
    term.1 * log(term.2)
  } else if(g < (s.obs / s.est) & g >= 0) {
    m <- ceiling(g * s.est)
    expected.num.species(m = m, f = f, f0.func = f0.func)["s.ind"]
  } else NA
  c(m.g = unname(m.g), g = g, x)
}
