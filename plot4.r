# Read data
myData <- read.table("household_power_consumption.txt",sep=";",header = TRUE, stringsAsFactors=F)
dim(myData)
head(myData)

# Subset dates 2007-02-01 and 2007-02-02
library(dplyr)
subData <- filter(myData, Date == "1/2/2007" | Date=="2/2/2007")
subData$Date_Time <- paste(subData$Date, subData$Time)
subData$Date_Time <- strptime(subData$Date_Time,"%d/%m/%Y %H:%M:%S")
subData$Sub_metering_1 <- as.numeric(subData$Sub_metering_1)
subData$Sub_metering_2 <- as.numeric(subData$Sub_metering_2)

#png("Plot3.png",width=480,height = 480)

par(mfrow=c(2,2))

#plot1
with(subData, plot(Date_Time, Global_active_power,type="n",xlab="",
                   ylab="Global Active Power (kilowatt)"))
lines(subData$Date_Time, subData$Global_active_power)

#plot2
with(subData, plot(Date_Time, Voltage,type="n",xlab="datetime",
                   ylab="Voltage"))
lines(subData$Date_Time, subData$Voltage)

#plot3
with(subData, plot(Date_Time, Sub_metering_1, type="n",xlab="",
                   ylab="Energy sub metering"))
lines(subData$Date_Time, subData$Sub_metering_1)
lines(subData$Date_Time, subData$Sub_metering_2, col="red")
lines(subData$Date_Time, subData$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"),lty=c(1,1),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
with(subData, plot(Date_Time, Global_reactive_power,type="n",xlab="datetime",
                   ylab="Global_reactive_power"))
lines(subData$Date_Time, subData$Global_reactive_power)


dev.off()
