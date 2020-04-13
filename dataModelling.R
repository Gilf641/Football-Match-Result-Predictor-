# Load the required libraries 
require(caret)
require(randomForest)
require(Hmisc)
require(tidyverse)
require(ggplot2)
require(esquisse)

# actually one can create a module and call it as a source 
avgData <- read.csv('averageStats_SeriaA.csv')
summary(avgData)

plot(avgData$Avg_FTHG~avgData$Avg_HS)
with(avgData, text(avgData$Avg_FTHG~avgData$Avg_HS, labels = c(HomeTeam, AwayTeam), pos = 3, cex = 0.46))
glimpse(avgData)
