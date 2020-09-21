

#data was read and subsetting was done
df <- "./household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#plotting and savingg the plots in png
dayandtime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subset$Global_active_power)
grp <- as.numeric(subset$Global_reactive_power)
volt <- as.numeric(subset$Voltage)
subMeter1 <- as.numeric(subset$Sub_metering_1)
subMeter2 <- as.numeric(subset$Sub_metering_2)
subMeter3 <- as.numeric(subset$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dayandtime, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dayandtime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

plot(dayandtime, volt, type="l", xlab="datetime", ylab="Voltage")

plot(dayandtime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(dayandtime, subMeter2, type="l", col="red")
lines(dayandtime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

dev.off()