###############################################################################
###                             SEAN ANDREW CHEN                            ###
###                               PUI2017 HW8                               ###
###############################################################################


###############################################################################
###                             IMPORT LIBRARIES                            ###
###############################################################################
library(lubridate)
library(RCurl)

###############################################################################
###                           SET WD & READ IN DATA                         ###
###############################################################################

#x <- getURL("https://raw.github.com/aronlindberg/latent_growth_classes/master/LGC_data.csv")
#y <- read.csv(text = x)
#Set PUIData working environment?
setwd("~/Dropbox/academics/graduate/nyu-cusp/semester_01/urban-informatics/coding/PUI2017_sac820/HW8_sac820")
collisionData <- read.csv('NYPD_Motor_Vehicle_Collisions.csv', header=TRUE)

collisionData$YEARMONTHDAY <- strptime(x = as.character( collisionData$DATE ), format = "%Y-%m-%d")
collisionData$TIME <- strptime(x = as.character( collisionData$TIME ), format = "%H:%M")
  

#Turn Time and Date from factors into datetime datatypes
collisionData$YEARMONTHDAYTIME <- strptime(x = as.character( collisionData$TIME ), format = "%Y-%m-%d %H:%M")
collisionData$MONTHDAYTIME <-
collisionData$MONTHDAY <-
collisionData$MONTH <-
collisionData$DAYOFWEEK <-
collisionData$YEAR <-
collisionData$TIME <- 
  
levels(collisionData$CONTRIBUTING.FACTOR.VEHICLE.1)
levels(collisionData$VEHICLE.TYPE.CODE.1)


#Let's look at cyclist accidents
cyclistData <- subset(collisionData, VEHICLE.TYPE.CODE.1 == "BICYCLE")

#QUESTION: What time of day are traffic fatalities more likely to occur? 


#QUESTION: What are the leading causes of traffic fatalities?