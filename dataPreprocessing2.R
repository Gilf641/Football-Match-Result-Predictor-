#read the entire SerieA dataset

setwd('C:\\Users\\Rohan Shetty\\Desktop\\FootballDatasets\\Football-Match-Result-Predictor-\\Datasets')

SerieA_Data <- read.csv('SerieA.csv')

tail(SerieA_Data)

dpF <- read.csv('dpFinal.csv')

head(dpF)

home <- as.array(unique(dpF$HomeTeam))
away <- as.array(unique(dpF$AwayTeam))


dpF1 <- dpF

newdf <- NULL
for (i in length(home)){
  for (j in length(away)){
    
    newdf$HomeTeam <- home[i]
    newdf$AwayTeam <- away[i]
    
  }
}


for (i in home){
  for (j in away){
    print(i)
    }
}

# teamwiseAnalysis('Juventus','Napoli')
# this is almost the right way but do some minor changes like changing the data structrure used or some minor ones!


# READ THE FILE
avgData <- read.csv('averageStats_SeriaA.csv')

 
# remove the Avg values for HTR and FTR
avgData <- avgData[-c(6,9)]
