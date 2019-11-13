# I guess I need start applying the algorithms or create some visualizations before 
require(caret)
require(randomForest)
require(Hmisc)
require(tidyverse)


setwd('C:\\Users\\Rohan Shetty\\Desktop\\FootballDatasets\\Football-Match-Result-Predictor-\\Datasets')
avgData <- read.csv('averageStats_SeriaA.csv')
head(avgData)


