## LOAD TIDYVERSE FOR TABLE MANIPULATION
library(tidyverse)
## LOAD LUBRIDATE FOR DATE, TIME MANIPULATION
library(lubridate)

## READ IN DATA FROM TEXT FILE
elec.pwr <- read.delim2("../household_power_consumption.txt", header=TRUE, 
                        sep=";", na.strings="?")

## CONVERT TO TIBBLE
elec.tbl <- tibble(elec.pwr)

## SELECT ONLY THE DATA FROM 2007-02-01 AND 2007-02-02
elec.tbl.sel <- filter(elec.tbl, Date == "1/2/2007" | Date == "2/2/2007")

## COMBINE DATE, TIME INTO SINGLE VARIABLE
datetime<- paste(elec.tbl.sel$Date,elec.tbl.sel$Time)

## CONVERT DATETIME INTO POSIXCT
datetime2 <- dmy_hms(datetime)

## PLOT GLOBAL ACTIVE POWER (Y) VS TIME (X)
plot(datetime2, elec.tbl.sel$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

## EXPORT TO PNG
dev.copy(png, file = "plot2.png")
dev.off()