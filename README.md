![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/sprex?color=red)
![](http://cranlogs.r-pkg.org/badges/last-day/sprex?color=red)
![](http://cranlogs.r-pkg.org/badges/last-week/sprex?color=red)
![](http://cranlogs.r-pkg.org/badges/sprex?color=red)
![](http://cranlogs.r-pkg.org/badges/grand-total/sprex?color=red)  
[![Travis-CI Build Status](https://travis-ci.org/EricArcher/sprex.svg?branch=master)](https://travis-ci.org/EricArcher/sprex)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/EricArcher/sprex?branch=master&svg=true)](https://ci.appveyor.com/project/EricArcher/sprex)
# sprex

## Description

*sprex* is a package for calculating species richness for rarefaction and extrapolation.

## Installation

To install the stable version from CRAN:

```r
install.packages('sprex')
```

To install the latest version from GitHub:

```r
# make sure you have Rtools installed
if (!require('devtools')) install.packages('devtools')
# install from GitHub
devtools::install_github('ericarcher/sprex')
```

## Contact

* submit suggestions and bug-reports: <https://github.com/ericarcher/sprex/issues>
* send a pull request: <https://github.com/ericarcher/sprex/>
* e-mail: <eric.archer@noaa.gov>

## version 1.4.1 (current on GitHub)

* added `pct.range` argument to `clench` function to specify minimum and maximum percentages of sample sizes
* changed argument `m` in `expected.num.species` function to accept vectors and return a matrix