dataPower <- "./data/household_power_consumption.txt" 
## Getting full dataset
fullData <- read.table(dataPower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

## Subsetting the data
subsetData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007") ,] 
rm(fullData)

# head(subsetData)
## Plot 2
subsetData$datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power) 

png("plot2.png", width=480, height=480) 
plot(subsetData$datetime, subsetData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off() 

