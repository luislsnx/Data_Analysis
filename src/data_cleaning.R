############################
## Dataset cleaning steps ##
############################

#### Load packages ####
library(dplyr)
library(tidyr)
library(VIM)
library(ggplot2)

#### Load data ####
data <- read.csv2("../data/movies.csv", sep = ",")

# Keep one title column as identifier
data <- data %>%
  rename(title = film_title)

# Remove redundant title columns and links (keep main title as identifier)
data <- data %>% select(-c(list_title, film_url))

# Check structure
str(data)

#### Fix variable types ####
data <- data %>% 
  mutate(avg_rating = as.numeric(avg_rating)) %>%
  mutate(viewers = as.numeric(gsub(",","", viewers))) %>%
  mutate(budget = as.numeric(gsub(",","", budget))) %>%
  mutate(revenue = as.numeric(gsub(",","", revenue)))

#### Outliers ####
data %>%
  select(where(is.numeric)) %>%
  pivot_longer(everything()) %>%
  ggplot(aes(x = name, y = value)) +
  geom_boxplot(outlier.colour = "red")

data_clean <- data[!data$revenue %in% boxplot.stats(data$revenue)$out,]

#### NA detection ####
colSums(is.na(data))

#### Imputation ####
data_no_id <- data_clean %>% select(-title)
data_imputed_num <- kNN(data_no_id, imp_var = FALSE)

data_imputed <- bind_cols(
  data_clean %>% select(title),
  data_imputed_num
)

saveRDS(data_imputed, "../data/movies_clean.rds")