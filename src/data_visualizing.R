############################
##  Dataset visualizations ##
############################

library(dplyr)
library(ggplot2)

# Load clean data (post-cleaning)
clean <- readRDS("../data/movies_clean.rds")

# Create output folder for figures (optional)
dir.create("../figures", showWarnings = FALSE)

############################
## 1) Distributions (clean data)
############################

save_hist <- function(df, var, filename, bins = 30) {
  p <- ggplot(df, aes(x = .data[[var]])) +
    geom_histogram(bins = bins) +
    labs(
      title = paste("Distribución de", var, "(dataset limpio)"),
      x = var,
      y = "Frecuencia"
    )
  ggsave(filename, p, width = 7, height = 4)
}

# Histograms for key numeric variables (only if they exist)
for (v in c("revenue", "budget", "viewers", "avg_rating", "runtime")) {
  if (v %in% names(clean)) {
    save_hist(clean, v, paste0("../figures/dist_", v, ".png"))
  }
}

############################
## 2) Variable relations (clean data)
############################

# budget vs revenue
if (all(c("budget", "revenue") %in% names(clean))) {
  p <- ggplot(clean, aes(x = budget, y = revenue)) +
    geom_point(alpha = 0.6) +
    geom_smooth(method = "lm", se = FALSE) +
    labs(title = "Relación budget vs revenue", x = "budget", y = "revenue")
  ggsave("../figures/scatter_budget_revenue.png", p, width = 7, height = 4)
}

# viewers vs revenue
if (all(c("viewers", "revenue") %in% names(clean))) {
  p <- ggplot(clean, aes(x = viewers, y = revenue)) +
    geom_point(alpha = 0.6) +
    geom_smooth(method = "lm", se = FALSE) +
    labs(title = "Relación viewers vs revenue", x = "viewers", y = "revenue")
  ggsave("../figures/scatter_viewers_revenue.png", p, width = 7, height = 4)
}

############################
## 3) Contrast Visualization
############################

if (all(c("film_year", "revenue") %in% names(clean))) {
  clean <- clean %>%
    mutate(
      year_factor = as.factor(ifelse(
        film_year <= 1970, "old",
        ifelse(film_year <= 2000, "mid", "new")
      ))
    )
  
  p <- ggplot(clean, aes(x = year_factor, y = revenue)) +
    geom_boxplot() +
    labs(title = "Revenue por periodo de estreno", x = "Periodo", y = "Revenue")
  
  ggsave("../figures/boxplot_revenue_yearfactor.png", p, width = 7, height = 4)
}
