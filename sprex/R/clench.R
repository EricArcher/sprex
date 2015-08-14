#' @rdname f0
#' 
#' @param n.pct percent of total number of samples to resample up to in curve fitting. 
#'   If <= 1, is taken to be in range of \code{0:1}, otherwise is taken to be in \code{0:100}.
#' @param num.reps number of random re-orderings of samples to fit curve to.
#' 
#' @importFrom stats coef nls nls.control
#' @export
#' 
clench <- function(f, n.pct = 100, num.reps = 100) {
  # create matrix of random samples of increasing sizes for multiple replicates
  if(n.pct > 1 & n.pct <= 100) n.pct <- n.pct / 100
  if(n.pct > 100) stop("'n.pct' must be in 0:1 or 0:100")
  sample.freq <- species.to.sample.freq(f)
  num.samples <- 1:ceiling(sum(sample.freq) * n.pct)
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
  
  s.est <- unname(floor(nls.coefs["a"] / nls.coefs["b"]))
  s.obs <- length(unique(sample.vec))
  f0 <- max(s.obs, s.est) - s.obs
  c(s.est = s.obs + f0, f0 = f0, s.obs = s.obs, n = length(sample.vec))
}