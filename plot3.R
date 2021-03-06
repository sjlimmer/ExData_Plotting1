data <- read.table('household_power_consumption.txt', header=FALSE, sep=';', skip=66637, nrows=2880, 
                   na.strings='?', stringsAsFactors = FALSE)
names(data) = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage',
                'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
data$DateTime <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
png(file = "plot3.png", width = 480, height = 480, units = 'px')
plot(data$DateTime, data$Sub_metering_1, type='n', xlab='', ylab='Energy sub metering')
lines(data$DateTime, data$Sub_metering_1, col='black', type='l')
lines(data$DateTime, data$Sub_metering_2, col='red', type='l')
lines(data$DateTime, data$Sub_metering_3, col='blue', type='l')
legend("topright", col = c("black", "red", 'blue'), lty = c(1,1,1), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()

