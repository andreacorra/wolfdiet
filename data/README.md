# Dataset

The wolfdiet database is available in different formats:

* **wolfdiet.backup** postgresql backup file to restore the database. 
* **wolfdiet.sqlite** sqlite database.  
* **wolfdiet.zip** R-data package including two tables in a ready-to-use format for diet analysis
  * **wolfdiet** table including all diet analysis
  * **lookup** lookup table explaining abbreviations 
* **wolfdiet.csv** Same two tables in a ready-to-use format for diet analysis

# Installation R-package

Download the zip file directly from this directory: [https://github.com/andreacorra/wolfdiet/raw/master/data/wolfdiet.zip](https://github.com/andreacorra/wolfdiet/raw/master/data/wolfdiet.zip)

Then use this file to install the R-package

``` r
remotes::install_local('~/Downloads/wolfdiet.zip')
``` 
