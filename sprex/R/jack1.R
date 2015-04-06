#' @rdname f0
#' 
#' @export

jack1 <- function(f) {
  x <- f.stats(f)
  s.est <- unname(x["s.obs"] + f[1])
  c(s.est = s.est, f0 = f[1], x)
}