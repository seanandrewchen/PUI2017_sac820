###############################################################################
###                             SEAN ANDREW CHEN                            ###
###                               PUI2017 HW8                               ###
###############################################################################


###############################################################################
###                             IMPORT LIBRARIES                            ###
###############################################################################
library(lubridate)
library(RCurl)
library(chron)


###############################################################################
###                               READ IN DATA                              ###
###############################################################################

### WARNING: FILE IS 250+MB
dataFile <- getURL("https://s3.amazonaws.com/aws-website-seanandrewchen-repository-40es3/pui2017_data/NYPD_Motor_Vehicle_Collisions.csv")
collisionData <- read.csv(textConnection(dataFile), header = TRUE)
head(collisionData)


###############################################################################
###                       TAKE A LOOK AT FACTOR LEVELS                      ###
###############################################################################
levels(collisionData$CONTRIBUTING.FACTOR.VEHICLE.1)
levels(collisionData$VEHICLE.TYPE.CODE.1)



###############################################################################
###                            CLEAN UP TIME DATA                           ###
###############################################################################
collisionData$DATE <- sapply(collisionData$DATE, as.character)
collisionData$TIME <- sapply(collisionData$TIME, as.character)

collisionData$DATETIME <- paste(collisionData$DATE, collisionData$TIME, sep = " ")
collisionData$DATETIME <- strptime(collisionData$DATETIME, "%m/%d/%Y %H:%M")

collisionData$MONTH <- collisionData$DATETIME$mon+1    #month of year (zero-indexed)
collisionData$YEAR <- collisionData$DATETIME$year+1900 #year (number of years since 1900)
collisionData$DAYOFWEEK <- collisionData$DATETIME$wday #day of week
collisionData$DAYMONTH <- collisionData$DATETIME$mday  #day of month
collisionData$HOUR <- collisionData$DATETIME$hour      #hour
collisionData$MIN <- collisionData$DATETIME$min        #minute

collisionData <- collisionData[,!names(collisionData) %in% c("DATE", "BOROUGH", "CONTRIBUTING.FACTOR.VEHICLE.3", "CONTRIBUTING.FACTOR.VEHICLE.4", "CONTRIBUTING.FACTOR.VEHICLE.5", "VEHICLE.TYPE.CODE.3", "VEHICLE.TYPE.CODE.4", "VEHICLE.TYPE.CODE.5", "TIME", "ZIP.CODE", "LATITUDE", "LONGITUDE", "LOCATION", "ON.STREET.NAME", "CROSS.STREET.NAME", "OFF.STREET.NAME", "UNIQUE.KEY")]


  
###############################################################################
###                            FOCUS ON CYCLING                             ###
###############################################################################
cyclistData <- subset(collisionData, VEHICLE.TYPE.CODE.1 == "BICYCLE")



#QUESTION: What time of day are traffic fatalities more likely to occur? 
#QUESTION: What are the leading causes of traffic fatalities?