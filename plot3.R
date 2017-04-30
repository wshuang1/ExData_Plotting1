## Assume data source file household_power_consumption.txt is in currect working directory

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
myData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(myData$Global_active_power)

myMeter1 <- as.numeric(myData$Sub_metering_1)
myMeter2 <- as.numeric(myData$Sub_metering_2)
myMeter3 <- as.numeric(myData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, myMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime,myMeter2, type="l", col="red")
lines(datetime, myMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# close dev
dev.off()


