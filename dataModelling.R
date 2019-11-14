# I guess I need start applying the algorithms or create some visualizations before 
require(caret)
require(randomForest)
require(Hmisc)
require(tidyverse)
require(VIM)
require(ggplot2)
require(esquisse)

# actually one can create a module and call it as a source 

setwd('C:\\Users\\Rohan Shetty\\Desktop\\FootballDatasets\\Football-Match-Result-Predictor-\\Datasets')
avgData <- read.csv('averageStats_SeriaA.csv')
head(avgData)

summary(avgData)



view(avgData)

str(avgData)

# dataViz

plot(avgData$Avg_FTHG~avgData$Avg_HS)
with(avgData, text(avgData$Avg_FTHG~avgData$Avg_HS, labels = c(HomeTeam, AwayTeam), pos = 3, cex = 0.46))


