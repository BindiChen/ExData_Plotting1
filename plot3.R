# Read Data
data <- read.table("household_power_consumption.txt", header=T,sep=";")
# Convert string to Date format
data$Date <- as.Date(data$Date , format="%d/%m/%Y")
# Get the data between 01/02/2007 and 02/02/2007
newData <- data[data$Date>=as.Date("01/02/2007", format="%d/%m/%Y") & data$Date<=as.Date("02/02/2007", format="%d/%m/%Y"),]
# Convert  Factor into float 
newData$Sub_metering_1 <- as.numeric(as.character(newData$Sub_metering_1))
newData$Sub_metering_2 <- as.numeric(as.character(newData$Sub_metering_2))
newData$Sub_metering_3 <- as.numeric(as.character(newData$Sub_metering_3))

# get the index of Thu, Fri and Sat
indexOfThu <- 0
indexOfFri <- which(newData$Date > as.Date("01/02/2007", format="%d/%m/%Y"))[1]
indexOfSat <- nrow(newData)

# Plot 3
png(file="plot3.png", width = 480, height = 480, bg="transparent")
par(new=F)
plot(newData$Sub_metering_1, type="l",ylim=c(0,40), xaxt = "n", xlab="", ylab = "Energy sub metering", col="black")
par(new=T)
plot(newData$Sub_metering_2, type="l",ylim=c(0,40), xaxt = "n", xlab="", ylab = "", col="red")
par(new=T)
plot(newData$Sub_metering_3, type="l",ylim=c(0,40), xaxt = "n", xlab="", ylab = "", col="blue")
par(new=F)
axis(1, at=c(indexOfThu,indexOfFri,indexOfSat), labels=c("Thu","Fri","Sat"))
dev.off()
