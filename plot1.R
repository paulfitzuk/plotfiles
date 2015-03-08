library(datasets)

## Assuming file is downloaded to working directory already. 
##fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##download.file(fileUrl, destfile = "household_power_consumption.txt", method = "curl")

##fast read data to data.table and filter to 2 days in Feb (1st and 2nd)
housedata <- fread("household_power_consumption.txt", sep = ";", header = TRUE)
FebData <- data.frame(housedata[housedata$Date %in% c("1/2/2007","2/2/2007"),])

##Converted to data.frame as its the only way I know how to use strptime to create a time stamp
FebData$Tstamp <-strptime(paste(FebData$Date,FebData$Time), format="%d/%m/%Y %H:%M:%S")

hist(as.numeric(FebData$Global_active_power), col="red", main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.copy(png, file="plot1.png")
dev.off()