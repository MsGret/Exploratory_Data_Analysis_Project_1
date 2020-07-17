# Course Project 1 - plot 3

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

subData$dateTime <- strptime(paste(subData$Date, subData$Time), format = "%Y-%m-%d %H:%M:%S")

# change day description
Sys.setlocale("LC_TIME", "English")


# file device
png("plot3.png", width = 480, height = 480)

plot(x = subData$dateTime, y = subData$Sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(x = subData$dateTime, y = subData$Sub_metering_2, col = "red")
lines(x = subData$dateTime, y = subData$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

dev.off()