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

#show the plot
png(filename="plot3.png",width=480, height = 480)

col_lines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(valid_time, valid_data$Sub_metering_1, type="l", col=col_lines[1], xlab="", ylab="Energy sub metering")
lines(valid_time, valid_data$Sub_metering_2, col=col_lines[2])
lines(valid_time, valid_data$Sub_metering_3, col=col_lines[3])
legend("topright", legend=labels, col=col_lines, lty="solid")

#creates the PNG file
dev.off()
