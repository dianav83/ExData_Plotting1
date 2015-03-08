## This program assumes that you have downloaded the data from 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
## and have unzipped the file and placed the file household_power_consumption.txt 
## in the working directory.

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                 stringsAsFactors = FALSE, na.strings = "?")
pwrbydat <- data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
pwrbydat$DateTime <- strptime(paste(pwrbydat$Date, pwrbydat$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(pwrbydat$DateTime, pwrbydat$Global_active_power, 
     xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")
plot(pwrbydat$DateTime, pwrbydat$Voltage, 
     xlab = "datetime", ylab = "Voltage", type = "l")
plot(pwrbydat$DateTime, pwrbydat$Sub_metering_1, 
     xlab = "", ylab = "Energy sub metering", type = "l")
lines(pwrbydat$DateTime, pwrbydat$Sub_metering_2, type = "l", col = "red")
lines(pwrbydat$DateTime, pwrbydat$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), bty = "n", col = c("black", "red", "blue"))
plot(pwrbydat$DateTime, pwrbydat$Global_reactive_power, 
     xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()