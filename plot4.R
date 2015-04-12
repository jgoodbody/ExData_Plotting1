##Read in data
data <- read.csv("household_power_consumption.txt",header=TRUE,sep = ";")

##Create POSIXt class "Time" column
data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S", tz = "")

##Create Date class "Date" column
data$Date <- as.Date(data$Date,"%d/%m/%Y")

##Subset data for Feb 1, 2007 - Feb 2, 2007
data2 <- subset(data, data$Date >= as.Date("2007-02-01"))
data3 <- subset(data2, data2$Date <= as.Date("2007-02-02"))

##Create PNG file and graphs
png(file="plot4.png")
par(mfrow=c(2,2))
plot(x=data3$Time,y=as.numeric(as.character(data3$Global_active_power)),type="l",xlab="",ylab="Global Active Power")
plot(x=data3$Time,y=as.numeric(as.character(data3$Voltage)),type="l",xlab="datetime",ylab="Voltage")
plot(x=c(data3$Time,data3$Time,data3$Time),y=c(as.numeric(as.character(data3$Sub_metering_1)),as.numeric(as.character(data3$Sub_metering_2)),as.numeric(as.character(data3$Sub_metering_3))),type="l",xlab="",ylab="Energy sub metering")
legend("topright",pch="-",bty="n",col = c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(x=data3$Time,y=as.numeric(as.character(data3$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()