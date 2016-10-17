#Assume this data is extracted,and put some suitable place 
#before executing this function
#Read the data 
hh_file <- "./data/household_power_consumption.txt"
valid_data <- read.table(text = grep("^[1,2]/2/2007",readLines(hh_file),value=TRUE), sep = ';', 
                         col.names = c("Date", "Time", "Global_active_power", 
                                       "Global_reactive_power", "Voltage", "Global_intensity", 
                                       "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')


valid_time <- strptime(paste(valid_data$Date,valid_data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
valid_data = cbind(valid_time, valid_data)
#creates the PNG file
png(filename="plot4.png",width=480, height = 480)

## Generating Plot 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
col_lines <- c("black","red","blue")

#show the plot
par(mfrow=c(2,2))
plot(valid_time, valid_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(valid_time, valid_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(valid_time, valid_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col=col_lines[1])
lines(valid_time, valid_data$Sub_metering_2, type="l",col=col_lines[2])
lines(valid_time, valid_data$Sub_metering_3, type="l",col=col_lines[3])
legend("topright", bty="n", legend=labels, lty=1,col=col_lines)
plot(valid_time, valid_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#close the PNG file
dev.off()

