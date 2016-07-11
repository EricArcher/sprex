[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/sprex)](https://cran.r-project.org/package=sprex)
[![](http://cranlogs.r-pkg.org/badges/grand-total/sprex)](http://cran.rstudio.com/web/packages/sprex/index.html)
[![Travis-CI Build Status](https://travis-ci.org/EricArcher/sprex.svg?branch=master)](https://travis-ci.org/EricArcher/sprex)

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

## Changes in 1.4.2

## Changes in v 1.4.1

* added pct.range to clench function to specify minimum and maximum percentages of sample sizes
* changed argument m in expected.num.species to accept vectors and return a matrix