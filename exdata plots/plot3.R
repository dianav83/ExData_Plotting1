## This program assumes that you have downloaded the data from 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
## and have unzipped the file and placed the file household_power_consumption.txt 
## in the working directory.

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                 stringsAsFactors = FALSE, na.strings = "?")
pwrbydat <- data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
pwrbydat$DateTime <- strptime(paste(pwrbydat$Date, pwrbydat$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
plot(pwrbydat$DateTime, pwrbydat$Sub_metering_1, 
     xlab = "", ylab = "Energy sub metering", type = "l")
lines(pwrbydat$DateTime, pwrbydat$Sub_metering_2, type = "l", col = "red")
lines(pwrbydat$DateTime, pwrbydat$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()
