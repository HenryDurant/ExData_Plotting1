
setwd("C:/Users/Henry/Documents/Rworkingdirectory/Exploratory Data Analysis")
library(lubridate)
library(dplyr)
library(tidyr)
library(ggplot2)

## LOAD DATA 
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))
data1 <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

## PARSE DATES AND TIME: 
DateTime <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S", tz = "")
data2 <- cbind(DateTime, data1)

##Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data2$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
dev.off()

