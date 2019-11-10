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
require(esquisse)
require(dplyr)
require(ggplot2)
require(tibble)
require(Amelia)





teamwiseAnalysis <- function(homeTeam, awayTeam)
  dpF %>% filter(HomeTeam == homeTeam & AwayTeam == awayTeam) %>% summarise(Home_Team = as.character(HomeTeam), Away_Team = as.character(AwayTeam),
                                                                            FTHG_Avg = mean(FTHG),
                                                                            FTAG_Avg = mean(FTAG),
                                                                            
                                                                            HTHG_Avg = mean(HTHG),
                                                                            HTAG_Avg = mean(HTAG),
                                                                           
                                                                            HS_Avg = mean(HS),
                                                                            AS_Avg = mean(AS),
                                                                            HST_Avg = mean(HST),
                                                                            AST_Avg = mean(AST),
                                                                            HF_Avg = mean(HF),
                                                                            AF_Avg = mean(AF),
                                                                            HC_Avg = mean(HC), 
                                                                            AC_Avg = mean(AC), 
                                                                            HY_Avg = mean(HY), 
                                                                            AY_Avg = mean(AY),
                                                                            HR_Avg = mean(HR),
                                                                            AR_Avg = mean(AR))
}

for (i in home){
  for (j in away){
    print(i)
    }
}

teamwiseAnalysis('Juventus','Napoli')
# this is almost the right way but do some minor changes like changing the data structrure used or some minor ones!

