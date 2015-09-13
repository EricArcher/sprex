rm(list = ls())
library(sprex)
load("colwell.2012.spp.freq.rdata")

f <- expand.f.vec(beetle.old)

n.vec <- c(1, seq(20, 220, 20), 237, 337, seq(437, 1237, 200))
chao.s <- t(sapply(n.vec, calc.s.ind, f = f))

g.vec <- seq(0.3, 0.9, 0.1)
chao.g <- t(sapply(g.vec, calc.m.g, f = f))

dc.chao <- discovery.curve(f, ylab = "# Species", n.pts = 250)
