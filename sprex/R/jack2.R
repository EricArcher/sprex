#' @rdname f0
#' 
#' @export
jack2 <- function(f) {
  x <- f.stats(f)
  s.est <- ifelse(length(f) == 1, NA, x["s.obs"] + (2 * f[1]) - f[2])
  c(s.est = unname(s.est), f0 = unname(s.est - x["s.obs"]), x)
}
