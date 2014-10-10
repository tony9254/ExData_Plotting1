# Use pipe to read the data of the dates 1/1/2007 and 1/2/2007
# note data format is day/month/year

header_names<-read.table(file="household_power_consumption.txt",sep=";",nrows=1,header=TRUE)
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')
                   ,sep=";",col.names=names(header_names),na.strings="?")


png(file="Plot 1.png")
hist(data$Global_active_power,col="red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
dev.off()
