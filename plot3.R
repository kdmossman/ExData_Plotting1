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

## PLOT SUB METERING 1 (Y) VS TIME (X)
plot(datetime2, as.numeric(elec.tbl.sel$Sub_metering_1), type="l", col="black", xlab="", 
     ylab="Energy sub metering")

## ADD PLOT SUB METERING 2
points(datetime2, as.numeric(elec.tbl.sel$Sub_metering_2), type="l", col="red")

## ADD PLOT SUB METERING 3
points(datetime2, as.numeric(elec.tbl.sel$Sub_metering_3), type="l", col="blue")

## ADD LEGEND
legend("topright", pch ="___", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## EXPORT TO PNG
dev.copy(png, file = "plot3.png")
dev.off()
