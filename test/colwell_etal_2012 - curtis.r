# recreate example in Colwell et al 2012 to get correct variance estimator

# note that variance component will equal zero for any frequency count of zero in data

# data input
i = c(1,2,3,4,5,6,7,8,14,42)
fi = c(84,10,4,3,5,1,2,1,1,1)

# function definitions
calc.f0 = function(f1,f2) {   # this code ignores possibility of f2=0
  f1^2/(2*f2)
}

calc.Sobs = function(fi) { sum(fi) }

calc.n = function(i, fi) { sum(i*fi) }

calc.Sind = function(i, fi, m, n=NA) {
  Sobs = calc.Sobs(fi)
  if (is.na(n)) n = calc.n(i, fi)
  f0 = calc.f0(fi[1],fi[2])
  return(Sobs + f0*(1-(1-fi[1]/(n*f0))^m))
}

calc.Sind2 = function(i, fi, m, n=NA) { # this code assumes f2 is included in fi vector
  Sobs = calc.Sobs(fi)
  if (is.na(n)) n = calc.n(i, fi)
  f0 = calc.f0(fi[1],fi[2])
  return(Sobs + f0*(1-exp(-(m/n)*(fi[1]/f0))))
}

# compare to published results
f0 = calc.f0(fi[1],fi[2])
Sobs = calc.Sobs(fi)
n = calc.n(i,fi)
Sind.m100 = calc.Sind(i, fi, 100)
Sind.m200 = calc.Sind(i, fi,200)
Sind.m400 = calc.Sind(i, fi,400)
Sind.m600 = calc.Sind(i, fi,600)
Sind.m800 = calc.Sind(i, fi,800)
Sind.m1000 = calc.Sind(i, fi,1000)

# this version of function assumes that n and m do not vary, 
# and calc both plus and minus one at fi
# all variance functions' code assumes f2 is included in fi vector
var.v1 = function(i, fi, m) {
  n.orig = calc.n(i,fi)
  f0.orig = calc.f0(fi[1],fi[2])
  Sobs.orig = calc.Sobs(fi)
  Sind.orig = calc.Sind(i, fi, m)
  delS.delfi = rep(NA,length(i))
  for (j in 1:length(i)) {
    a1 = c(rep(0,j-1),1,rep(0,length(i)-j))
    fi.m1 = fi - a1
    fi.p1 = fi + a1
    delS.m1 = Sind.orig - calc.Sind(i, fi.m1, m, n.orig)
    delS.p1 = calc.Sind(i, fi.p1, m, n.orig) - Sind.orig
    delS.delfi[j] = (delS.m1+delS.p1)/2
  }
  varsum = 0
  for (j in 1:length(i)) {
    for (k in 1:length(i)) {
      if (k==j) { cov.fi = fi[j]*(1-fi[j]/(Sobs.orig+f0.orig))
      } else { cov.fi = -fi[j]*fi[k]/(Sobs.orig+f0.orig) }
      varsum = varsum + delS.delfi[j]*delS.delfi[k]*cov.fi
    }
  }
  return(varsum)
}
sqrt(var.v1(i,fi,100))
sqrt(var.v1(i,fi,200))
sqrt(var.v1(i,fi,400))
sqrt(var.v1(i,fi,800))
sqrt(var.v1(i,fi,1000))
# woohoo this is it!

# this version of function assumes that n and m do not vary, 
# and calc only plus one at fi
var.v2 = function(i, fi, m) {
  n.orig = calc.n(i,fi)
  f0.orig = calc.f0(fi[1],fi[2])
  Sobs.orig = calc.Sobs(fi)
  Sind.orig = calc.Sind(i, fi, m)
  delS.delfi = rep(NA,length(i))
  for (j in 1:length(i)) {
    a1 = c(rep(0,j-1),1,rep(0,length(i)-j))
    fi.p1 = fi + a1
    delS.p1 = calc.Sind(i, fi.p1, m, n.orig) - Sind.orig
    delS.delfi[j] = delS.p1
  }
  varsum = 0
  for (j in 1:length(i)) {
    for (k in 1:length(i)) {
      if (k==j) { cov.fi = fi[j]*(1-fi[j]/(Sobs.orig+f0.orig))
      } else { cov.fi = -fi[j]*fi[k]/(Sobs.orig+f0.orig) }
      varsum = varsum + delS.delfi[j]*delS.delfi[k]*cov.fi
    }
  }
  return(varsum)
}
sqrt(var.v2(i,fi,100))
sqrt(var.v2(i,fi,200))
sqrt(var.v2(i,fi,400))
sqrt(var.v2(i,fi,800))
sqrt(var.v2(i,fi,1000))
# similar, but difference from published values increases as extrapolate further out

# let n and m vary, use plus/minus one for delS
# note that if m and n  vary, extrap to small num beyond sample size could lead to negative m in calcs, seems odd
var.v3 = function(i, fi, m) {
    n.orig = calc.n(i,fi)
    f0.orig = calc.f0(fi[1],fi[2])
    Sobs.orig = calc.Sobs(fi)
    Sind.orig = calc.Sind(i, fi, m)
    delS.delfi = rep(NA,length(i))
    for (j in 1:length(i)) {
      a1 = c(rep(0,j-1),1,rep(0,length(i)-j))
      fi.m1 = fi - a1
      fi.p1 = fi + a1
      delS.m1 = Sind.orig - calc.Sind(i, fi.m1, m+i[j], n.orig-i[j])
      delS.p1 = calc.Sind(i, fi.p1, m-i[j], n.orig+i[j]) - Sind.orig
      delS.delfi[j] = (delS.m1+delS.p1)/2
    }
    varsum = 0
    for (j in 1:length(i)) {
      for (k in 1:length(i)) {
        if (k==j) { cov.fi = fi[j]*(1-fi[j]/(Sobs.orig+f0.orig))
        } else { cov.fi = -fi[j]*fi[k]/(Sobs.orig+f0.orig) }
        varsum = varsum + delS.delfi[j]*delS.delfi[k]*cov.fi
      }
    }
    return(varsum)
}
sqrt(var.v3(i,fi,1000))
# waaay off

