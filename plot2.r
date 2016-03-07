# Read data
myData <- read.table("household_power_consumption.txt",sep=";",header = TRUE, stringsAsFactors=F)
dim(myData)
head(myData)

# Subset dates 2007-02-01 and 2007-02-02
library(dplyr)
subData <- filter(myData, Date == "1/2/2007" | Date=="2/2/2007")
subData$Date_Time <- paste(subData$Date, subData$Time)
subData$Date_Time <- strptime(subData$Date_Time,"%d/%m/%Y %H:%M:%S")
subData$Global_active_power <- as.numeric(subData$Global_active_power)

png("Plot2.png",width=480,height = 480)

with(subData, plot(Date_Time, Global_active_power,type="n",xlab="",
                   ylab="Global Active Power (kilowatt)"))
lines(subData$Date_Time, subData$Global_active_power)

dev.off()
