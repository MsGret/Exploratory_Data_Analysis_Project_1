# Course Project 1 - plot 1

# Download the data for the project:
zipFilename <- "exdata_data_household_power_consumption.zip"

foldername <- "Course Project 1 Data"
if (!file.exists(foldername)){
  unzip(zipFilename)
}

setwd("./Course Project 1 Data")
fullData <- read.table("household_power_consumption.txt", skip = 1, sep = ';',
                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                                     "Voltage", "Global_intensity", "Sub_metering_1",
                                     "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

fullData$Date <- as.Date(fullData$Date, "%d/%m/%Y")

subData <- subset(fullData, Date == "2007-02-01" | Date == "2007-02-02")

# file device
png("plot1.png", width = 480, height = 480)

#basic plot function
hist(subData$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)")

dev.off()