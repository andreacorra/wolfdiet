# Dataset

The wolfdiet database is available in four different formats:

## DATABASE
1. **wolfdiet.backup** postgresql backup file to restore the database. 
2. **wolfdiet.sqlite** sqlite database.  

## FLAT FILE 
3. **wolfdiet.zip** R-data package including two tables in a ready-to-use format for diet analysis.
   * **wolfdiet** table including all diet analysis
   * **lookup** table explaining abbreviations 
4. **csv** Same two tables (wolfdiet, lookup) are also provided in csv. 

# Installation R-package

Download the zip file directly from this directory: [https://github.com/andreacorra/wolfdiet/raw/master/data/rpackage/wolfdiet.zip](https://github.com/andreacorra/wolfdiet/raw/master/data/rpackage/wolfdiet.zip)

Then use this file to install the R-package

``` r
remotes::install_local('~/Downloads/wolfdiet.zip')
``` 
