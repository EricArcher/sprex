pkgname <- "sprex"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "sprex-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('sprex')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("discovery.curve")
### * discovery.curve

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: discovery.curve
### Title: Discovery Curve
### Aliases: discovery.curve

### ** Examples

data(osa.old.growth)
f <- expand.freqs(osa.old.growth)
d <- discovery.curve(f, max.x = 1200)
plot(d)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("discovery.curve", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("expand.freqs")
### * expand.freqs

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: expand.freqs
### Title: Expand Frequency Matrix
### Aliases: expand.freqs

### ** Examples

data(osa.old.growth)
f <- expand.freqs(osa.old.growth)
f



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("expand.freqs", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("expected.num.species")
### * expected.num.species

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: expected.num.species
### Title: Expected Number of Species
### Aliases: expected.num.species

### ** Examples

data(osa.old.growth)
f <- expand.freqs(osa.old.growth)
expected.num.species(60, f)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("expected.num.species", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("f.stats")
### * f.stats

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: f.stats
### Title: Frequency Vector Statistics
### Aliases: f.stats

### ** Examples

data(osa.second.growth)
f <- expand.freqs(osa.second.growth)
f.stats(f)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("f.stats", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("f0")
### * f0

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ACE
### Title: Number of Unobserved Species
### Aliases: ACE Chao1 Swor1 f0 iChao1 jack1 jack2

### ** Examples

data(osa.second.growth)
f <- expand.freqs(osa.second.growth)

ace.est <- ACE(f)
chao1.est <- Chao1(f)
jack1.est <- jack1(f)
jack2.est <- jack2(f)
swor1.est <- Swor1(f, 20000)
ichao1.est <- iChao1(f)

f0.est <- cbind(
  ACE = ace.est["f0"],
  Chao1 = chao1.est["f0"],
  jack1 = jack1.est["f0"],
  jack2 = jack2.est["f0"],
  Swor1 = swor1.est["f0"],
  iChao1 = ichao1.est["f0"]
)
f0.est



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("f0", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("num.samples.required")
### * num.samples.required

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: num.samples.required
### Title: Number of Samples Required
### Aliases: num.samples.required

### ** Examples

data(osa.old.growth)
f <- expand.freqs(osa.old.growth)
num.samples.required(0.6, f)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("num.samples.required", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("sample.to.species.freq")
### * sample.to.species.freq

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: sample.to.species.freq
### Title: Create Vector of Species Frequencies
### Aliases: sample.to.species.freq

### ** Examples

x <- sample(1:100, 30, rep = TRUE)
f <- sample.to.species.freq(x)
print(x)
print(f)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("sample.to.species.freq", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("species.to.sample.freq")
### * species.to.sample.freq

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: species.to.sample.freq
### Title: Create Vector of Sample Frequencies
### Aliases: species.to.sample.freq

### ** Examples

data(osa.old.growth)
f <- expand.freqs(osa.old.growth)
x <- species.to.sample.freq(f)
print(f)
print(x)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("species.to.sample.freq", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
