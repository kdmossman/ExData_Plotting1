## LOAD TIDYVERSE FOR TABLE MANIPULATION
library(tidyverse)

## READ IN DATA FROM TEXT FILE
elec.pwr <- read.delim2("../household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## CONVERT TO TIBBLE
elec.tbl <- tibble(elec.pwr)

## SELECT ONLY THE DATA FROM 2007-02-01 AND 2007-02-02
elec.tbl.sel <- filter(elec.tbl, Date == "1/2/2007" | Date == "2/2/2007")

## APPARENTLY NO NEED TO DISCARD ANY MISSING VALUES

## CONVERT GLOBAL ACTIVE POWER FROM CHARACTER TO NUMERIC!

## PLOT HISTOGRAM OF GLOBAL ACTIVE POWER
hist(as.numeric(elec.tbl.sel$Global_active_power), col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## EXPORT TO PNG
dev.copy(png, file = "plot1.png")
dev.off()