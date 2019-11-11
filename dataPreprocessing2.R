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

for (i in home){
  for (j in away){
    print(i)
    }
}

# teamwiseAnalysis('Juventus','Napoli')
# this is almost the right way but do some minor changes like changing the data structrure used or some minor ones!

head(dpF)
# remove the first column
# dpF <- dpF[-1]
# 
# avgData <- dpF %>% group_by(HomeTeam, AwayTeam) %>% 
#   summarise(Avg_FTHG = mean(FTHG), Avg_FTAG = mean(FTAG), 
#                                                    Avg_FTR = mean(FTR), Avg_HTHG = mean(HTHG), Avg_HTAG = mean(HTAG),
#                                                    Avg_HTR = mean(HTR), Avg_HS = mean(HS), Avg_AS = mean(AS),
#                                                    Avg_HST = mean(HST), Avg_AST = mean(AST), Avg_HF = mean(HF),
#                                                    Avg_AF = mean(AF), Avg_HC = mean(HC), Avg_AC = mean(AC), Avg_HY = mean(HY),
#                                                    Avg_AY = mean(AY), Avg_HR = mean(HR), Avg_AR = mean(AR))
# avgData <- as.data.frame(avgData)
# 
# write.csv(avgData,'averageStats_SeriaA.csv')


# READ THE FILE

avgData <- read.csv('averageStats_SeriaA.csv')

 
# remove the Avg values for HTR and FTR
avgData <- avgData[-c(6,9)]
head(avgData)
