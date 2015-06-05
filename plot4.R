##Read file, set date range as set variables as numeric
hp_data <- read.table("household_power_consumption.txt", header = T, sep=";", stringsAsFactors=FALSE)
hp_data <- hp_data[which(hp_data$Date=="1/2/2007" | hp_data$Date=="2/2/2007"),]
hp_data[hp_data == "?" ] = NA
hp_data$Global_active_power=as.numeric(hp_data$Global_active_power)
hp_data$Voltage=as.numeric(hp_data$Voltage)
hp_data$Global_Sub_metering_1=as.numeric(hp_data$Sub_metering_1)
hp_data$Global_Sub_metering_2=as.numeric(hp_data$Sub_metering_2)
hp_data$Global_Sub_metering_3=as.numeric(hp_data$Sub_metering_3)
hp_data$Global_reactive_power=as.numeric(hp_data$Global_reactive_power)

## Set date as time series for graph
datetime <- strptime(paste(hp_data_sub$Date, hp_data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Plot as PNG, set parameters to 2x2
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(datetime, hp_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, hp_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, hp_data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, hp_data$Sub_metering_2, type="l", col="red")
lines(datetime, hp_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),bty="n")
plot(datetime, hp_data$Global_reactive_power, type="l", ylab="Global_reactive_power")
dev.off()

