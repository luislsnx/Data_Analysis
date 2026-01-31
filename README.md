# Letterboxd Movie Data Cleaning Analysis and Visualization

**Author:** Luis Larbec Sánchez, Isabel Rodríguez Valle  
**Subject:** M2.851 – Tipología y ciclo de vida de los datos
**Master’s Degree:** Data Science – Universitat Oberta de Catalunya (UOC)  
**Year:** 2025/2026  

---

## 1. Overview

This project contains the R code for the integration, cleaning, validation and analysis of the movie data obtained from Letterboxd with the purpose of predicting movie revenue based on the available statistics.

---

## 2. Repository structure

/src/__main__.py → Python source code (Selenium + BeautifulSoup).
/dataset/ → Generated dataset (movies.csv) and its license (DATASET_LICENSE.txt).
requirements.txt → Required Python dependencies.
LICENSE → Software license (MIT).
DATASET_LICENSE.txt → Dataset license (CC BY 4.0).

---

## 3. Installation and execution

### Prerequisites

- Python 3.10+
- Google Chrome and ChromeDriver (matching versions)
- Internet access

### Installation

1. git clone https://github.com/irvalle/movie_data_scraping.git
2. cd movie_data_scraping
3. python -m venv .venv
4. source .venv/bin/activate   # On Windows: .venv\Scripts\activate
5. pip install -r requirements.txt

## SOURCE ACKNOWLEDGEMENT

Data are obtained from the public web platform Letterboxd (https://letterboxd.com) and used exclusively for educational and research purposes, in accordance with its terms of service.

## RUNNING THE SCRAPER

If no password is provided, public lists for the given username will be scraped.

python -m src.letterboxd_scraping
--username YOUR_USERNAME
--password YOUR_PASSWORD
--headful
--delay 1.5
--out dataset/movies.csv

Parameter	Description
--username	Letterboxd username
--password	Letterboxd password (for private lists only)
--out	Output path for the generated CSV (default: dataset/movies.csv)
--delay	Delay between requests in seconds (default: 1.0)
--headful	Opens the browser window (optional) Omit for headless mode
--user-agent	Custom User-Agent for ethical identification (default: Chrome-like UA)
--license	Dataset license to append in the metadata (CC-BY-4.0 or ODC-By)

---

## 4. GENERATED DATASET
Field	Description
list_title	Name of the Letterboxd list
film_title	Movie title
film_year	Year of release
avg_rating	Average rating by Letterboxd users
viewers	Members who have watched the film
runtime	Film duration
budget	Budget for the movie (from TMDB)
revenue	Revenue obtained (from TMBD)
film_url	Movie link on Letterboxd
An example of the obtained dataset can be found in Zenodo: https://doi.org/10.5281/zenodo.17566347

---

## 5. ETHICAL USE
The scraper respects Letterboxd's robots.txt and includes a configurable delay (--delay) and identifiable User-Agent.
Only publicly available information is collected; no private or sensitive data are stored.
The project follows responsible scraping practices and is intended solely for academic and research purposes.

---

## 6. MAIN DEPENDENCES
Selenium -> browser automation

BeautifulSoup4 -> HTML parsing

argparse -> CLI argument parsing

---

## 7. SOURCE ACKNOWLEDGEMENT
Data are obtained from the public web platform Letterboxd (https://letterboxd.com) and used exclusively for educational and research purposes, in accordance with its terms of service.

---






