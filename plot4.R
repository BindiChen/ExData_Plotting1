# Read Data
data <- read.table("household_power_consumption.txt", header=T,sep=";")
# Convert string to Date format
data$Date <- as.Date(data$Date , format="%d/%m/%Y")
# Get the data between 01/02/2007 and 02/02/2007
newData <- data[data$Date>=as.Date("01/02/2007", format="%d/%m/%Y") & data$Date<=as.Date("02/02/2007", format="%d/%m/%Y"),]
# Convert  Factor into float 
newData$Global_active_power <- as.numeric(as.character(newData$Global_active_power))
newData$Voltage <- as.numeric(as.character(newData$Voltage))
newData$Global_reactive_power <- as.numeric(as.character(newData$Global_reactive_power))
newData$Sub_metering_1 <- as.numeric(as.character(newData$Sub_metering_1))
newData$Sub_metering_2 <- as.numeric(as.character(newData$Sub_metering_2))
newData$Sub_metering_3 <- as.numeric(as.character(newData$Sub_metering_3))

# get the index of Thu, Fri and Sat
indexOfThu <- 0
indexOfFri <- which(newData$Date > as.Date("01/02/2007", format="%d/%m/%Y"))[1]
indexOfSat <- nrow(newData)

# plot 4

png(file="plot4.png", width = 480, height = 480, bg="transparent")

par(mfrow=c(2,2))
# subplot 1
plot(newData$Global_active_power, type="l", xaxt = "n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(indexOfThu,indexOfFri,indexOfSat), labels=c("Thu","Fri","Sat"))
# subplot 2
plot(newData$Voltage, type="l", xaxt = "n", xlab="datetime", ylab="Voltage")
axis(1, at=c(indexOfThu,indexOfFri,indexOfSat), labels=c("Thu","Fri","Sat"))
# subplot 3
par(new=F)
plot(newData$Sub_metering_1, type="l",ylim=c(0,40), xaxt = "n", xlab="", ylab = "Energy sub metering", col="black")
par(new=T)
plot(newData$Sub_metering_2, type="l",ylim=c(0,40), xaxt = "n", xlab="", ylab = "", col="red")
par(new=T)
plot(newData$Sub_metering_3, type="l",ylim=c(0,40), xaxt = "n", xlab="", ylab = "", col="blue")
par(new=F)
axis(1, at=c(indexOfThu,indexOfFri,indexOfSat), labels=c("Thu","Fri","Sat"))
# subplot 4
plot(newData$Global_reactive_power, type="l", xaxt = "n", xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(indexOfThu,indexOfFri,indexOfSat), labels=c("Thu","Fri","Sat"))

dev.off()
