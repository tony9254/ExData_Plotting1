# Use pipe to read the data of the dates 1/1/2007 and 1/2/2007
# note data format is day/month/year

header_names<-read.table(file="household_power_consumption.txt",sep=";",nrows=1,header=TRUE)
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')
                   ,sep=";",col.names=names(header_names),na.strings="?")
#Combine data and time into one column
Date_and_Time <-paste(data$Date,data$Time,sep=" ")
data$Date_and_Time<-strptime(Date_and_Time,format="%d/%m/%Y %H:%M:%S")


png(file="Plot 4.png")
# Make 4 plots in the figure
par(mfcol=c(2,2))
# 1st plot
plot(data$Date_and_Time,data$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)")

# 2nd plot
plot(data$Date_and_Time,data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(data$Date_and_Time,data$Sub_metering_2,col="red")
lines(data$Date_and_Time,data$Sub_metering_3,col="blue")
legend("topright",names(data[,7:9]),
       col=c("black","red","blue"),lwd=1,bty="n")

# 3rd plot
plot(data$Date_and_Time,data$Voltage,
      type = "l",
      ylab = "Voltage",
      xlab = "datetime")
# 4th plot
plot(data$Date_and_Time,data$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.off()

