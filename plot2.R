##Read file, set date range as set variables as numeric
hp_data <- read.table("household_power_consumption.txt", header = T, sep=";", stringsAsFactors=FALSE)
hp_data <- hp_data[which(hp_data$Date=="1/2/2007" | hp_data$Date=="2/2/2007"),]
hp_data$Global_active_power=as.numeric(hp_data$Global_active_power)

## Set date as time series for graph
datetime <- strptime(paste(hp_data_sub$Date, hp_data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Plot to PNG
png("plot2.png", width=480, height=480)
plot(datetime, hp_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()