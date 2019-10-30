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

str(SerieA_Data)
table(SerieA_Data$HomeTeam == 'Napoli', SerieA_Data$FTR)

# cross tab analysis

xtabs(~FTHG, data = SerieA_Data )


#my next step is go according to the algorithm that you've written and do the same also write your SOP man
require(dplyr)

# I've taken Juventus vs Napoli for testing

testData <- SerieA_Data %>% filter(HomeTeam == 'Juventus' & AwayTeam == 'Napoli' | HomeTeam == 'Napoli' & AwayTeam == 'Juventus')
testData

test1 <- testData
# test1 will be the new dataset with all the averages ( lets take atleast previous 4 seasons)


testJuveHome <- test1 %>% filter(HomeTeam == 'Juventus')

JuveNapoli <- NULL

JuveNapoli$HomeTeam <- 'Juventus'
JuveNapoli$AwayTeam <- 'Napoli'


# for season 2019/20

JuveNapoli$FTHG_Avg <-  mean(testJuveHome$FTHG)
JuveNapoli <- as.data.frame(JuveNapoli)
JuveNapoli$FTAG_Avg <-  mean(testJuveHome$FTAG)
JuveNapoli$FTR_Mode <-  mode(testJuveHome$FTR)
JuveNapoli$HTHG_Avg <-  mean(testJuveHome$HTHG)
JuveNapoli$HTAG_Avg <-  mean(testJuveHome$HTAG)
JuveNapoli$HTR_Mode <-  mode(testJuveHome$HTR)
JuveNapoli$HS <-  mean(testJuveHome$HS)
JuveNapoli$AS <-  mean(testJuveHome$AS)
JuveNapoli$HST <- mean(testJuveHome$HST)
JuveNapoli$AST <- mean(testJuveHome$AST)
JuveNapoli$HF <- mean(testJuveHome$HF)
JuveNapoli$AF <- mean(testJuveHome$AF)
JuveNapoli$HC <- mean(testJuveHome$HC)
JuveNapoli$AC <- mean(testJuveHome$AC)
JuveNapoli$HY <- mean(testJuveHome$HY)
JuveNapoli$AY <- mean(testJuveHome$AY)
JuveNapoli$HR <- mean(testJuveHome$HR)
JuveNapoli$AR <- mean(testJuveHome$AR)


JuveNapoli


head(SerieA_Data)

#copy
finalDF <- SerieA_Data

# here I've taken season 2018/19 and 2019/20 as validation dataset and the rest as the training set

# in this finalDF I'm gonna remove date column if incase you need any visualization stuff use SerieA_Data

finalDF$Date <- NULL

# create a list of vectors of teams

ht <- as.array(unique(finalDF$HomeTeam))
ht
at <- as.array(unique(finalDF$AwayTeam))
at
# ht <- as.array(ht)
# ht

# this is just a simple check to make sure whether both arrays have all the teams, obviously there'll be but still

for (i in ht){
  if (i %in% at){
    print('Present')
  }
  else{
    print(i)
  }
}

tail(finalDF)

#copy1
f1 <- finalDF

sayChristopher <- function(){}
  


f1 %>% filter(HomeTeam == 'Lazio' & AwayTeam == 'Roma') %>% summarise(mean(FTHG), mean(FTAG)) 
