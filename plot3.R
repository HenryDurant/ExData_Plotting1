
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


##Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
par(mfrow=c(1,1))
plot(x=data2$DateTime, 
     y=as.numeric(data2$Sub_metering_1), 
     type='l', 
     xlab='', 
     ylab='Energy sub metering')
lines(x=data2$DateTime, 
      y=as.numeric(data2$Sub_metering_2), 
      type='l', 
      col='red')
lines(x=data2$DateTime, 
      y=as.numeric(data2$Sub_metering_3), 
      type='l', 
      col='blue')
legend(x='topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col=c('black', 'red', 'blue'), lty=c(1, 1, 1))
dev.off()
