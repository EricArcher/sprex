% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/num.samples.required.R
\name{num.samples.required}
\alias{num.samples.required}
\title{Number of Samples Required}
\usage{
num.samples.required(g, f, f0.func, ...)
}
\arguments{
\item{g}{propotion of total number of species.}

\item{f}{a vector of species frequencies where \code{f[i]} is the number of 
species represented by only \code{i} samples.}

\item{f0.func}{a function that computes the number of unobserved 
species (f0).}

\item{...}{other arguments to \code{f0.func}.}
}
\value{
a vector containing of the estimated additional number of samples 
  (\code{m.g}) required to observe \code{g} percent of the total number 
  of species.
}
\description{
Calculate the additional number of samples (individuals) to 
  required to observe a given proportion of the total number of species.
}
\examples{
data(osa.old.growth)
f <- expand.freqs(osa.old.growth)
num.samples.required(0.6, f = f, f0.func = Chao1)

}
\references{
Eqn 12 in Chao, A., R.K. Colwell, C.-W. Lin, and N.J. Gotelli. 2009. 
  Sufficient sampling for asymptotic minimum species richness estimators. 
  Ecology 90(4):1125-1133. \cr
  Eqn 11 in Colwell, R.K., A. Chao, N.J. Gotelli, S.-Y. Lin, 
  C.X. Mao, R.L. Chazdon, and J.T. Longino. 2012. Models and estimators 
  linking individual-based and sample-based rarefaction, extrapolation and 
  comparison of assemblages. Journal of Plant Ecology 5(1):3-21.
}
\author{
Eric Archer \email{eric.archer@noaa.gov}
}
