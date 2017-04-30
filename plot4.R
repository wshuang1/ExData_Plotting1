## Assume data source file household_power_consumption.txt is in currect working directory

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
myData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(myData$Global_active_power)
globalReactivePower <- as.numeric(myData$Global_reactive_power)

myMeter1 <- as.numeric(myData$Sub_metering_1)
myMeter2 <- as.numeric(myData$Sub_metering_2)
myMeter3 <- as.numeric(myData$Sub_metering_3)
myVoltage <- as.numeric(myData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, myVoltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, myMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, myMeter2, type="l", col="red")
lines(datetime, myMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# close dev
dev.off()


