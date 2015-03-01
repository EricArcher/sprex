#' @rdname f0
#' 
#' @export
iChao1 <- function(f) {
  x <- Chao1(f)
  n <- x["n"]
  if(length(f) < 4) return(c(f0 = NA, s.obs = x["obs"], n = n))
  s.est <- x["s.obs"] + x["f0"]
  term.1 <- (n - 3) / (4 * n)
  if(f[4] == 0) f[4] <- 1
  term.1 <- term.1 * f[3] / f[4]
  term.2 <- (n - 3) / (2 * (n - 1))
  term.3 <- f[2] * f[3] / f[4]
  term.4 <- f[1] - (term.2 * term.3)
  x["s.est"] <- unname(s.est + term.1 * max(term.4, 0))
  x["f0"] <- unname(x["s.est"] - x["s.obs"])
  x
}
