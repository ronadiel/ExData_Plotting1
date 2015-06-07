dataPower <- "./data/household_power_consumption.txt" 
## Getting full dataset
fullData <- read.table(dataPower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

## Subsetting the data
subsetData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007") ,] 
rm(fullData)

# head(subsetData)
## Plot 4
subsetData$datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)
subsetData$Global_reactive_power <- as.numeric(subsetData$Global_reactive_power)
subsetData$Sub_metering_1 <- as.numeric(subsetData$Sub_metering_1) 
subsetData$Sub_metering_2 <- as.numeric(subsetData$Sub_metering_2) 
subsetData$Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3) 
subsetData$Voltage <- as.numeric(subsetData$Voltage)

png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2))  

# upper left plot
plot(subsetData$datetime, subsetData$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2) 

# upper right plot
plot(subsetData$datetime, subsetData$Voltage, type="l", xlab="datetime", ylab="Voltage") 

# lower left plot
plot(subsetData$datetime, subsetData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(subsetData$datetime, subsetData$Sub_metering_2, type="l", col="red") 
lines(subsetData$datetime, subsetData$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 

# lower right plot
plot(subsetData$datetime, subsetData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 

dev.off() 
