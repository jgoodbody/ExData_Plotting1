##Read in data
data <- read.csv("household_power_consumption.txt",header=TRUE,sep = ";")

##Create POSIXt class "Time" column
data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S", tz = "")

##Create Date class "Date" column
data$Date <- as.Date(data$Date,"%d/%m/%Y")

##Subset data for Feb 1, 2007 - Feb 2, 2007
data2 <- subset(data, data$Date >= as.Date("2007-02-01"))
data3 <- subset(data2, data2$Date <= as.Date("2007-02-02"))

##Create PNG file and line graph
##I could not figure out how to give different colors to the graphs
png(file="plot3.png")
plot(x=c(data3$Time,data3$Time,data3$Time),y=c(as.numeric(as.character(data3$Sub_metering_1)),as.numeric(as.character(data3$Sub_metering_2)),as.numeric(as.character(data3$Sub_metering_3))),type="l",xlab="",ylab="Energy sub metering")
legend("topright",pch="-",col = c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()