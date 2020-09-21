
#data was read and subsetting was done
df <- "./household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#plots and saving them in png
dayandtime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMeter1 <- as.numeric(subset$Sub_metering_1)
subMeter2 <- as.numeric(subset$Sub_metering_2)
subMeter3 <- as.numeric(subset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dayandtime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(dayandtime, subMeter2, type="l", col="red")
lines(dayandtime, subMeter3, type="l", col="blue")
legend("topright", c("Submetering 1", "Submetering 2", "Submetering 3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()