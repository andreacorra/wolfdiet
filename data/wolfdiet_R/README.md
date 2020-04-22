# R-Package 

The R-package allows to load the wolfdiet data directly in R.
This includes two tables in a ready-to-use format for diet analysis.

  * **wolfdiet** table including all diet analysis
  * **lookup** table explaining abbreviations

# Installation 

1. Download this [zip file](https://github.com/andreacorra/wolfdiet/raw/master/data/wolfdiet_R/wolfdiet.zip) 
2. Then use this file to install the R-package

``` r
remotes::install_local('~/Downloads/wolfdiet.zip')
``` 

# Usage

### Load data 
``` r
library(wolfdiet)

# load data 
data(wolfdiet)

# Scientific names of taxa
wolf_a <- wolf(tax=TRUE)
# Common names of taxa 
wolf_b <- wolf(tax=FALSE)

# Lookup table 
data(lookup)
``` 
