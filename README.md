<!-- badges: start -->
[![Travis build status](https://travis-ci.com/celestezeng33/STAT302package.svg?branch=master)](https://travis-ci.org/celestezeng33/STAT302package)
  [![Codecov test coverage](https://codecov.io/gh/celestezeng33/STAT302package/branch/master/graph/badge.svg)](https://codecov.io/gh/celestezeng33/STAT302package?branch=master)
<!-- badges: end -->

# Introduction of this package: 
This package is created as a class project for Stat302 in UW. It contains four formulas: my_t_test, my_lm, my_knn_cv, 
and my_rf_cv. This package is collabrated by Celeste Zeng and Simona Liao

# Installation
To download the Stat302 package, use the code below.

```r
# install.packages("devtools")
devtools::install_github("celestezeng33/STAT302package")
library(STAT302package)
```

# Use
The vignette demonstrates example usage of all main functions. You can see the vignette by using the following code:

```r
# install.packages("devtools")
devtools::install_github("celestezeng33/STAT302package", build_vignette = TRUE, build_opts = c())
library(STAT302package)
# Use this to view the vignette in the Demo HTML help
help(package = "STAT302package", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "STAT302package")
```

