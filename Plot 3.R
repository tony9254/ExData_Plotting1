# Use pipe to read the data of the dates 1/1/2007 and 1/2/2007
# note data format is day/month/year

header_names<-read.table(file="household_power_consumption.txt",sep=";",nrows=1,header=TRUE)
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')
                   ,sep=";",col.names=names(header_names),na.strings="?")
#Combine data and time into one column
Date_and_Time <-paste(data$Date,data$Time,sep=" ")
data$Date_and_Time<-strptime(Date_and_Time,format="%d/%m/%Y %H:%M:%S")

# Now plot and then use lines command to plot the other sub meterings
png(file="Plot 3.png")
plot(data$Date_and_Time,data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(data$Date_and_Time,data$Sub_metering_2,col="red")
lines(data$Date_and_Time,data$Sub_metering_3,col="blue")
legend("topright",names(data[,7:9]),
       col=c("black","red","blue"),lwd=1)
dev.off()
