dataPower <- "./data/household_power_consumption.txt" 
## Getting full dataset
fullData <- read.table(dataPower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

## Subsetting the data
subsetData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007") ,] 
rm(fullData)

# head(subsetData)
## Plot 3
subsetData$datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

subsetData$Sub_metering_1 <- as.numeric(subsetData$Sub_metering_1) 
subsetData$Sub_metering_2 <- as.numeric(subsetData$Sub_metering_2) 
subsetData$Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3) 

png("plot3.png", width=480, height=480) 
plot(subsetData$datetime, subsetData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(subsetData$datetime, subsetData$Sub_metering_2, type="l", col="red") 
lines(subsetData$datetime, subsetData$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
dev.off() 


