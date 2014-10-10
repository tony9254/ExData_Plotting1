# Use pipe to read the data of the dates 1/1/2007 and 1/2/2007
# note data format is day/month/year

header_names<-read.table(file="household_power_consumption.txt",sep=";",nrows=1,header=TRUE)
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')
                   ,sep=";",col.names=names(header_names),na.strings="?")
#Combine data and time into one column
Date_and_Time <-paste(data$Date,data$Time,sep=" ")
data$Date_and_Time<-strptime(Date_and_Time,format="%d/%m/%Y %H:%M:%S")

#Plot data
png(file="Plot 2.png")
plot(data$Date_and_Time,data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()


