##Read in data
data <- read.csv("household_power_consumption.txt",header=TRUE,sep = ";")

##Create POSIXt class "Time" column
data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S", tz = "")

##Create Date class "Date" column
data$Date <- as.Date(data$Date,"%d/%m/%Y")

##Subset data for Feb 1, 2007 - Feb 2, 2007
data2 <- subset(data, data$Date >= as.Date("2007-02-01"))
data3 <- subset(data2, data2$Date <= as.Date("2007-02-02"))

##Create PNG file and histogram
png(file="plot1.png")
hist(as.numeric(as.character(data3$Global_active_power)),main="Global Active Power",col=2,xlab="Global Active Power (kilowatts)")
dev.off()