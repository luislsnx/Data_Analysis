# Letterboxd Movie Data Cleaning Analysis and Visualization

**Author:** Luis Larbec Sánchez, Isabel Rodríguez Valle  
**Subject:** M2.851 – Tipología y ciclo de vida de los datos

**Master’s Degree:** Data Science – Universitat Oberta de Catalunya (UOC)  
**Year:** 2025/2026  

---

## 1. Overview

This repository contains the R scripts and data files used for the integration, cleaning, validation, analysis, and visualization of movie-related data obtained from Letterboxd.

The main objective of the project is to prepare and explore movie statistics and metadata in order to support downstream analytical tasks, including exploratory analysis and the study of relationships between movie features and revenue-related variables.

This repository is designed as an academic project and not as an installable R package. Scripts are intended to be executed manually or interactively within an R environment (e.g. RStudio).

---

## 2. Repository structure

```text
MOVIE_DATA_ANALYSIS/
│
├── data/
│   ├── movies.csv           # Raw movie data obtained from Letterboxd
│   └── movies_clean.rds     # Cleaned and processed dataset
│
├── figures/
│   └── ...                  # Generated plots and visual outputs
│
├── src/
│   ├── data_cleaning.R      # Data cleaning and preprocessing script
│   ├── data_analysis.R      # Exploratory data analysis and modeling
│   └── data_visualizing.R   # Data visualization and plotting
│
├── .gitignore
├── LICENSE
└── README.md
```
---

## 3. Installation and execution

### Prerequisites
- R (version 4.0 or higher recommended)
- RStudio (optional but recommended)

The required R packages are loaded directly inside the scripts. If a package is missing, R will prompt you to install it manually.

### Installation

Clone or download the repository

```bash
git clone https://github.com/irvalle/movie_data_analysis.git
```

or download it as a ZIP and extract it.

Open the project folder in RStudio (recommended).

Run the scripts in order:
- src/data_cleaning.R
This script reads movies.csv and generates movies_clean.rds.
- src/data_analysis.R
Performs exploratory analysis and modeling using the cleaned data.
- src/data_visualizing.R
Produces plots and saves them into the figures/ folder.

## SOURCE ACKNOWLEDGEMENT

Data are obtained from the public web platform Letterboxd (https://letterboxd.com) and used exclusively for educational and research purposes, in accordance with its terms of service.






