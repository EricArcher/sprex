#' @rdname f0
#' 
#' @export
Swor1 <- function(f, N) {
  if(length(f) == 1) f <- c(f, 0)
  x <- f.stats(f)
  n <- x["n"]
  q <- n / N
  r <- q / (1 - q)
  w <- n / (n - 1)
  term.1 <- f[1] ^ 2
  term.2 <- 2 * w * f[2]
  term.3 <- r * f[1]
  Swor1 <- x["s.obs"] + (term.1 / (term.2 + term.3))

  term.4 <- term.2 * Swor1 ^ 2
  term.5 <- term.1 * Swor1
  term.6 <- term.5 ^ 2 / (f[1] ^ 5)
  term.7 <- 4 * w ^ 2 * f[2]
  term.8 <- (Swor1 / f[1]) ^ 4
  sd.s.est <- unname(sqrt(Swor1 + term.6 + (term.7 * term.8)))
  c(s.est = unname(Swor1), f0 = unname(Swor1 - x["s.obs"]), x, sd.s.est = sd.s.est)
}
