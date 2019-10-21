# Football Match Result Predictor

#read a file and check how can you do the same using function

setwd('C:\\Users\\Rohan Shetty\\Desktop\\FootballDatasets\\Football-Match-Result-Predictor-\\Datasets')


s1718 <- read.csv('SerieA 2017-18.csv')
head(s1718)


colnames(s1718)


ii8 <- read.csv('SerieA 2017-05.csv')
colnames(ii8)

# Remove the irrelevant columns

readNprocessIt <- function(fileName){
  rf <- read.csv(fileName)
  data <- as.data.frame(rf)
  df <- data[c(-1, -23:-65)]
  head(df)
}
readNprocessIt('SerieA 2017-18.csv')


# 2012-13
readNprocess73 <- function(fileName){
  rf <- read.csv(fileName)
  data <- as.data.frame(rf)
  df <- data[c(-1, -23:-73)]
  head(df)
}

readNprocess73('SerieA 2012-13')








#comment 1(5:08 PM ) this func works fantastic, customize it according to the files like some have 60+ columns other 70+ so in that way


list1 <-c(list.files('C:\\Users\\Rohan Shetty\\Desktop\\FootballDatasets\\\\Football-Match-Result-Predictor-\\Datasets'))
for (i in list1){
  readFile <- read.csv(i)
  dataFrame <- as.data.frame(readFile)
  print(i)
  print('\\\\\\\\\\\\')
  print(colnames(dataFrame))
  print('............')
  }

























