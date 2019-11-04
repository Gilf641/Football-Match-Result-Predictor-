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

head(dpF)

require(dplyr)

teamwiseAnalysis <- function(homeTeam, awayTeam){
  dpF %>% filter(HomeTeam == homeTeam & AwayTeam == awayTeam) %>% summarise(FTHG_Avg = mean(FTHG))
}

for (i in home){
  for (j in away){
    print(i)
    }
}

teamwiseAnalysis('Juventus','Napoli')
