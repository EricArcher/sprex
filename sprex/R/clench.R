#' @rdname f0
#' 
#' @param pct.range two-element numeric vector giving minimum and maximum 
#'   percent of samples to resample in curve fitting. Must be in range of \code{0:1}.
#' @param num.reps number of random re-orderings of samples to fit curve to.
#' 
#' @importFrom stats coef nls nls.control
#' @importFrom swfscMisc isBetween
#' @export
#' 
clench <- function(f, pct.range = c(0.1, 0.9), num.reps = 100) {
  if(!all(isBetween(pct.range, 0, 1))) stop("'pct.range' must be in 0:1")
  pct.range <- sort(pct.range)
  # convert f to sample frequency distribution
  sample.freq <- species.to.sample.freq(f)
  # get minimum and maximum number of samples
  n <- sum(sample.freq)
  min.n <- ceiling(n * min(pct.range))
  max.n <- ceiling(n * max(pct.range))
  min.n <- max(1, min.n)
  max.n <- min(max.n, n)
  # create data.frame of random samples of increasing sizes for multiple replicates
  num.samples <- min.n:max.n
  sample.vec <- rep(1:length(sample.freq), sample.freq)
  num.species <- do.call(rbind, lapply(1:num.reps, function(i) {
    x <- sample(sample.vec)
    sapply(num.samples, function(j) length(unique(x[1:j])))
  }))
  num.species <- colMeans(num.species)
  df <- data.frame(num.samples = num.samples, num.species = num.species)

  # fit clench curve to data
  clench.nls <- nls(
    num.species ~  (a * num.samples) / (1 + (b * num.samples)), data = df, 
    start = list(a = 1, b = 1), control = nls.control(minFactor = 1 / 16384, warnOnly = TRUE)
  )
  nls.coefs <- coef(clench.nls)
  
  # return estimates
  s.est <- unname(floor(nls.coefs["a"] / nls.coefs["b"]))
  s.obs <- length(unique(sample.vec))
  f0 <- max(s.obs, s.est) - s.obs
  c(s.est = s.obs + f0, f0 = f0, s.obs = s.obs, n = length(sample.vec))
}