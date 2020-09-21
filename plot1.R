
#data was read and subset was a made
df <- "./household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#code for the plot and saving as png
varname <- as.numeric(subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(varname, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
