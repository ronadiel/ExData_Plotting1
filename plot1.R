dataPower <- "./data/household_power_consumption.txt" 
## Getting full dataset
fullData <- read.table(dataPower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

## Subsetting the data
subsetData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007") ,] 
rm(fullData)

# head(subsetData) 
## Plot 1
globalActivePower <- as.numeric(subsetData$Global_active_power) 
png("plot1.png", width=480, height=480) 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off() 
