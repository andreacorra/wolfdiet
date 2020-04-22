# WolfDiet
![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/andreacorra/wolfdiet?include_prereleases)
![GitHub repo size](https://img.shields.io/github/repo-size/andreacorra/wolfdiet)
[![DOI](https://zenodo.org/badge/162189606.svg)](https://zenodo.org/badge/latestdoi/162189606)  


Diet analysis of the world's wolves (*Canis lupus*)

![Wolf Prey Spectrum](https://github.com/andreacorra/WolfDiet/blob/master/images/wolf_prey_spectrum.png)
Artist: _Andrea Gazzola_

This repository includes the codes and information used to develop a **PostgreSQL Database** containing the studies carried out on wolf's feeding ecology throughout its distribution range. The database is Open Access and available to use under the Creative Commons conditions (CC BY-NC-SA 4.0, see below for the full license). The main goal is to encourage researchers to participate in data collection and to foster collaboration among researchers from Asia, Europe and the Americas. Currently, researchers from Romania, Italy, and the Netherlands are collaborating in developing the database. The preprint of this work will be later released in [bioRxiv](https://www.biorxiv.org/).   

The repository is divided in subdirectories:  

* **[wolfdiet DB](https://github.com/andreacorra/WolfDiet/tree/master/wolfdiet_db)**: The SQLite version of the **wolfdiet** database;
* **[database structure](https://github.com/andreacorra/WolfDiet/tree/master/db_structure)**: Database structure (SQL code used for database development);
* **[bibliography](https://github.com/andreacorra/WolfDiet/tree/master/bibliography)**: List of articles reviewed and currently added in the database;
* **[images](https://github.com/andreacorra/WolfDiet/tree/master/images)**: List of images used in the GitHub repository;
* **[data](https://github.com/andreacorra/WolfDiet/tree/master/data)**: wolfdiet database downloadable in different formats
  * [**csv**](https://github.com/andreacorra/WolfDiet/tree/master/data/wolfdiet.csv)
  * [**r-package**](https://github.com/andreacorra/wolfdiet/raw/master/data/wolfdiet.zip) 
  * [**backup**] **TBD**
  * [**sqlite**] **TBD**

A more comprehensive description of the database is available at the [wiki](https://github.com/andreacorra/WolfDiet/wiki) page. For a better understanding of the reasons that led to this work, check the [conference poster](https://www.researchgate.net/publication/310561849_Food_habits_of_wolf_in_Eurasia_a_proposal_for_an_open_access_database) presented at the 8th International Zoological Congress of “Grigore Antipa” Museum, Romania.

# Installation

Download the zip file directly https://github.com/jedgroev/piac/raw/master/wolfdiet/wolfdiet.zip

Then use this file to install the R-package

``` r
remotes::install_local('~/Downloads/wolfdiet.zip')
``` 

![CC](https://github.com/andreacorra/WolfDiet/blob/master/images/by-nc-sa.eu.svg)  
[**Full License**](https://creativecommons.org/licenses/by-nc-sa/4.0/)
