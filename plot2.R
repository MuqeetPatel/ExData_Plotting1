

#data was read and subsetting was done
df <- "./household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
                   
#plotting and saving
dayandtime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
varname<- as.numeric(subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dayandtime, varname, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
