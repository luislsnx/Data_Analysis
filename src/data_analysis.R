############################
##    Dataset analysis    ##
############################

#### Load packages ####
library(dplyr)
library(ggplot2)
library(caret)
library(randomForest)
library(factoextra)

#### Load data ####
data <- readRDS("../data/movies_clean.rds")

# Data split
training_indexs <- createDataPartition(data$revenue, times = 1, p = .8, list = F)
train <- data[training_indexs, ]
test <- data[-training_indexs, ]


#### Supervised model - RF ####
set.seed(42)
rf_model <- randomForest(revenue ~ . - title, data = train,
                         ntree = 500,       # number of trees
                         mtry = 2,          # number of variables randomly sampled at each split
                         importance = TRUE)

print(rf_model)

predictions <- predict(rf_model, newdata = test)

# Compare predicted vs actual
head(data.frame(Actual = test$revenue, Predicted = predictions))

# Plot importance
varImpPlot(rf_model)

# Root Mean Squared Error (RMSE)
sqrt(mean((predictions - test$revenue)^2))


#### Unsupervised model ####
X <- data %>%
  select(where(is.numeric), -revenue)

# Scale features
X_scaled <- scale(X)

if (exists("kmeans") && !is.function(kmeans)) rm(kmeans)

# Calculate clusters w/silhouette
fviz_nbclust(X_scaled,kmeans, method = "silhouette")

k <- 6
km_model <- kmeans(X_scaled, centers = k, nstart = 25)


# Add cluster labels to the original data
data$cluster <- as.factor(km_model$cluster)

# How many movies in each cluster
table(data$cluster)

# View cluster centers (scaled features)
km_model$centers

# Using factoextra
fviz_cluster(km_model, data = X_scaled, ellipse.type = "norm", geom = "point", stand = FALSE)

#### Hypothesis contrast ####

# Based on varimp the release year is important so lets check if there are differences between older and newer movies

model <- lm(revenue ~ film_year, data = data)
summary(model)

# We can also check it converting year into a factor, dividing for example in the year 1970 and 2000 as cultural points

data_div_year <- data %>%
  mutate(year_factor = as.factor(ifelse(film_year <= 1970, "old",
                                        ifelse(film_year <= 2000, "mid", "new"))))

# ANOVA
anova <- aov(revenue ~ year_factor, data = data_div_year)
summary(anova)
TukeyHSD(anova)

# Normality of residuals
shapiro.test(residuals(anova))

# Homogeneity of variances
bartlett.test(revenue ~ year_factor, data = data_div_year)

