wolfdiet
================
Diet analysis of the world's wolves (*Canis lupus*)  

![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/andreacorra/wolfdiet?include_prereleases)
![GitHub repo size](https://img.shields.io/github/repo-size/andreacorra/wolfdiet)
[![DOI](https://zenodo.org/badge/162189606.svg)](https://zenodo.org/badge/latestdoi/162189606)  


![Wolf Prey Spectrum](https://github.com/andreacorra/WolfDiet/blob/master/images/wolf_prey_spectrum.png)
Artist: _Andrea Gazzola_

This repository includes the codes and information used to develop a **PostgreSQL Database** that contains studies on feeding ecology of wolf across its distribution range. The database is Open Access and is available for use under the term of the Creative Commons (CC BY-NC-SA 4.0, see Full License below). The main objective is to enable researchers to engage in data collection and to promote collaboration among Asian, European and American researchers. Scientists from Romania, Italy and the Netherlands are currently working together to create the database. This work's preprint will later be published in [bioRxiv](https://www.biorxiv.org/).   

The repository is divided in subdirectories:  

* **[bibliography](https://github.com/andreacorra/WolfDiet/tree/master/bibliography)**: List of publications currently reviewed and added to database;
* **[code](https://github.com/andreacorra/WolfDiet/tree/master/code)**: List of scripts used to build the database and import the diet studies, as well as the R package workflow used to download the data via R.
* **[data](https://github.com/andreacorra/WolfDiet/tree/master/data)**: The **wolfdiet** data downloadable in four different file formats:
  * [R](https://github.com/andreacorra/wolfdiet/raw/master/data/wolfdiet_R/wolfdiet.zip) package of the wolfdiet data view - see [here](https://github.com/andreacorra/wolfdiet/tree/master/data/wolfdiet_R) for installation instructions.  
  * [csv](https://github.com/andreacorra/wolfdiet/raw/master/data/wolfdiet_csv) version of the wolfdiet data view.
  * [psql](https://github.com/andreacorra/wolfdiet/raw/master/data/wolfdiet_psql/wolfdiet.backup) version of the wolfdiet database.
  * [sqlite](https://github.com/andreacorra/wolfdiet/raw/master/data/wolfdiet_sqlite/wolfdiet.sqlite) version of the wolfdiet database.
* **[images](https://github.com/andreacorra/WolfDiet/tree/master/images)**: List of images used in this repository;  
* **[wolfdiet](https://github.com/andreacorra/WolfDiet/tree/master/wolfdiet)**: The R package that can be used to download data;


A comprehensive description of the database is available at the [WIKI](https://github.com/andreacorra/WolfDiet/wiki) page. For a better understanding of the reasons that led to this work, check the [conference poster](https://www.researchgate.net/publication/310561849_Food_habits_of_wolf_in_Eurasia_a_proposal_for_an_open_access_database) presented at the 8th International Zoological Congress of “Grigore Antipa” Museum, Romania.
  
  
![CC](https://github.com/andreacorra/WolfDiet/blob/master/images/by-nc-sa.eu.svg)    
[**Full License**](https://creativecommons.org/licenses/by-nc-sa/4.0/)
