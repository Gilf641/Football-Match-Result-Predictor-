#read the entire SerieA dataset
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



#-----------------------------------Data Visualization-----------------------------------------

##  Top 10 teams in Serie A
# 1. Juventus
# 2. Napoli
# 3. Inter Milan
# 4. AC Milan
# 5. Roma
# 6. Lazio
# 7. Fiorentina
# 8. Udinese
# 9. Genoa
# 10. Sampdoria


top10 <- c('Juventus', 'Napoli', 'Inter', 'Milan', 'Roma', 'Lazio', 
           'Fiorentina', 'Udinese', 'Genoa', 'Atalanta')


require(ggplot2)
require(tibble)
require(esquisse)
glimpse(SerieA_Data)

#conv some variables to factor form

SerieA_Data$FTAG <- as.factor(SerieA_Data$FTAG)
SerieA_Data$FTHG <- as.factor(SerieA_Data$FTHG)
SerieA_Data$HTAG <- as.factor(SerieA_Data$HTAG)
SerieA_Data$HTHG <- as.factor(SerieA_Data$HTHG)

esquisse::esquisser(SerieA_Data)


# FTR ViSualization( Home Games )

SerieA_Data <- SerieA_Data %>%
 filter(!(HTR %in% ""))

ggplot(SerieA_Data) +
 aes(x = HomeTeam, fill = FTR) +
 geom_bar() +
 scale_fill_viridis_d(option = "plasma") +
 coord_flip() +
 theme_minimal()
table(SerieA_Data$HomeTeam, SerieA_Data$FTR)




# FTR ViSualization( Away Games )
SerieA_Data %>%
  filter(!(HTR %in% "") & FTR == 'A') %>%
  ggplot(aes(x = AwayTeam)) +
  geom_bar() +
  scale_fill_viridis_d(option = "plasma") +
  coord_flip() +
  theme_minimal()
table(SerieA_Data$AwayTeam, SerieA_Data$FTR)



esquisse::esquisser(SerieA_Data)

# top 10 teams data

topHome <- SerieA_Data %>% filter(HomeTeam %in% top10)#  AwayTeam %in% top10)
topAway <- SerieA_Data %>% filter(AwayTeam %in% top10)
esquisse::esquisser(topHome)

homeWins <- topHome %>% filter(FTR == 'H')
ggplot(homeWins) +
 aes(x = HomeTeam, fill = FTHG) +
 geom_bar() +
 scale_fill_viridis_d(option = "plasma") +
 coord_flip() +
 theme_bw() + labs(title = 'HomeWins of Top 10 SerieA Clubs')# + geom_text( label = homeWins$FTHG)

# insight gained
# 1. Juventus in all asp have been best at home games
# 2. Napoli, Roma, Inter, Udinese and Fiorentina have done well when they've scored > 1 goal
# 3. Juventus are top in the list, with Roma, Napoli and Inter in 2nd, 3rd and 4th Position
# 4. Milan and Fiorentina are kinda similar.




awayWins <- topAway %>% filter(FTR == 'A' & FTAG != 0)
ggplot(awayWins) +
  aes(x = AwayTeam, fill = FTAG) +
  geom_bar() +
  scale_fill_viridis_d(option = "plasma") +
  coord_flip() +
  theme_bw() + labs(title = 'AwayWins of Top 10 SerieA Clubs')# + geom_text( label = homeWins$FTHG)


# insight gained
# 1. Undoubtedly, Juventus have the best defensive line in SerieA. Inter Milan are the next contenders
# 2. Roma, Milan and Lazio have good away record with most of the wins(by scoring 2 goals)
# 3. Juventus, Fiorentina, Napoli and Roma have the best away record( not in terms of no of matches won)
# 4. Atalanta and Genoa have poor away records.


# Total Shots

#home shots
hs <-  topHome %>%
 filter(FTR %in% "H")
ggplot(hs) +
 aes(x = HomeTeam, y = HS) +
 geom_boxplot(fill = "#b3e93e") +
 theme_minimal()

# # insights
# 1. Fiorentina, Inter, Juventus and Napoli have almost the same median no of shots at home
# 2. Roma is leading at the top, whereas Atalanta, Genoa and Udinese have lower percentile of median num of shots at home.



#home shots on target
hst <-  topHome %>%
  filter(FTR %in% "H")
ggplot(hst) +
  aes(x = HomeTeam, y = HST) +
  geom_boxplot(fill = "#b3e93e") +
  theme_minimal()

# same insights but 
 # share some insights related to IQR's

head(SerieA_Data)


# Yellow cards
str(SerieA_Data)

esquisse::esquisser(SerieA_Data)


