# Read data
myData <- read.table("household_power_consumption.txt",sep=";",header = TRUE, stringsAsFactors=F)
dim(myData)
head(myData)

# Subset dates 2007-02-01 and 2007-02-02
library(dplyr)
subData <- filter(myData, Date == "1/2/2007" | Date=="2/2/2007")


png("Plot1.png",width=480,height = 480)
hist(as.numeric(subData$Global_active_power),col="red",main="Global Active Power",
     xlab = "Global Active Power (kilowatt)")
dev.off()
