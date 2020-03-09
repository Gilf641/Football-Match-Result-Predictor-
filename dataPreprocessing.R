# Football Match Result Predictor

#read a file and check how can you do the same using function

setwd('C:\\Users\\Rohan Shetty\\Desktop\\FootballDatasets\\Football-Match-Result-Predictor-\\Datasets')

# custom function to read and preprocess the dataset files
# for files after 06-07 season
readNprocess <- function(fileName){
  rf <- read.csv(fileName)
  data <- as.data.frame(rf)
  n <- ncol(data)
  df <- data[-c(1, 23:n)]
  
  
}

# 2007-08
seven8 <- readNprocess('SerieA 2007-08.csv')

# 2008-09
eight9 <- readNprocess('SerieA 2008-09.csv')

# 2009-10
nine10 <- readNprocess('SerieA 2009-10.csv')

# 2010-11
ten11 <- readNprocess('SerieA 2010-11.csv')

# 2011-12
eleven12 <-readNprocess('SerieA 2011-12.csv')

# 2012-13
twelve13 <- readNprocess('SerieA 2012-13.csv')

# 2013-14
thirteen14 <-readNprocess('SerieA 2013-14.csv')

# 2014-15
fourteen15 <-readNprocess('SerieA 2014-15.csv')

# 2015-16
fifteen16 <-readNprocess('SerieA 2015-16.csv')

# 2016-17
sixteen17 <-readNprocess('SerieA 2016-17.csv')

# 2017-18
seventeen18 <-readNprocess('SerieA 2017-18.csv')

# 2018-19
eighteen19 <-readNprocess('SerieA 2018-19.csv')

# 2019-2020
nineteen20 <-readNprocess('SerieA 2019-20.csv')




#comment 1(5:08 PM ) this func works fantastic, customize it according to the files like some have 60+ columns other 70+ so in that way
# 

list1 <-c(list.files('C:\\Users\\Rohan Shetty\\Desktop\\FootballDatasets\\\\Football-Match-Result-Predictor-\\Datasets'))
for (i in list1){
  readFile <- read.csv(i)
  dataFrame <- as.data.frame(readFile)
  print(i)
  print('\\\\\\\\\\\\')
  print(colnames(dataFrame))
  print('............')
  }


# 
# 
# head(eighteen19)
# uuu <- read.csv('SerieA 2018-19.csv')
# head(uuu)
# colnames(uuu)
# eighteen19 <- uuu[-c(22:ncol(uuu))]
# 
# pp <-  read.csv('SerieA 2019-20.csv')
# head(pp)
# colnames(pp)
# nineteen20 <- pp[-c(1,3,24:ncol(pp))]
# ncol(nineteen20)
# ncol(eighteen19)
# 
# 
# 
# colnames(nineteen20)
# nineteen20 <- nineteen20[-2]
# head(nineteen20)
# head(eighteen19)
# 
# 
# D <- rbind(seven8, eight9, nine10, ten11, eleven12, twelve13, thirteen14, fourteen15, fifteen16, sixteen17, 
#       seventeen18, eighteen19, nineteen20)
# head(D)
# str(D)
# summary(D)
# 
# write.csv(D, file = 'SerieA.csv')

# read this file and comment out previous csv code

SerieA_Data <- read.csv('SerieA.csv')
head(SerieA_Data)
summary(SerieA_Data)
str(SerieA_Data)
