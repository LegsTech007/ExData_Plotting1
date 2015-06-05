##Read file, set date range as set variables as numeric
hp_data <- read.table("household_power_consumption.txt", header = T, sep=";", stringsAsFactors=FALSE)
hp_data <- hp_data[which(hp_data$Date=="1/2/2007" | hp_data$Date=="2/2/2007"),]
hp_data$Global_active_power=as.numeric(hp_data$Global_active_power)

##Plot to PNG
png("plot1.png", width=480, height=480)
hist(hp_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", xlim=c(0, 6), ylim=c(0, 1200), col = "red")
dev.off()