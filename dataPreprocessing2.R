#read the entire SerieA dataset

setwd('C:\\Users\\Rohan Shetty\\Desktop\\FootballDatasets\\Football-Match-Result-Predictor-\\Datasets')

SerieA_Data <- read.csv('SerieA.csv')

tail(SerieA_Data)

# create a copy 
# 
# sd <- SerieA_Data[c(-1,-2)]
# sd
# write.csv(sd,'dpFinal.csv')#,sep=',')

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
newdf
