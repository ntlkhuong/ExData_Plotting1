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
#Create the PNG file 
png(filename="plot1.png",width=480, height = 480)
#show the history
hist(valid_data$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)")
#close the PNG file
dev.off()