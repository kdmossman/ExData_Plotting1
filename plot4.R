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

## PLOT 2X2 GRAPHS
par(mfrow = c(2,2))

## UPPER LEFT: PLOT GLOBAL ACTIVE POWER
plot(datetime2, elec.tbl.sel$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

## UPPER RIGHT: PLOT VOLTAGE (Y) VS TIME (X)
plot(datetime2, elec.tbl.sel$Voltage, type="l", xlab="datetime", 
     ylab="Voltage")

## LOWER LEFT: PLOT SUB METERING
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

## LOWER RIGHT: PLOT REACTIVE POWER (Y) VS TIME (X)
plot(datetime2, elec.tbl.sel$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

