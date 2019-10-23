#read the entire SerieA dataset

setwd('C:\\Users\\Rohan Shetty\\Desktop\\FootballDatasets\\Football-Match-Result-Predictor-\\Datasets')

SerieA_Data <- read.csv('SerieA.csv')

head(SerieA_Data)

#remove first column
SerieA_Data <- SerieA_Data[-1]
tail(SerieA_Data)

# load all the reqd libs

require(psych)
require(ggplot2)
