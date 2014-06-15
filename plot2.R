# Read Data
data <- read.table("household_power_consumption.txt", header=T,sep=";")
# Convert string to Date format
data$Date <- as.Date(data$Date , format="%d/%m/%Y")
# Get the data between 01/02/2007 and 02/02/2007
newData <- data[data$Date>=as.Date("01/02/2007", format="%d/%m/%Y") & data$Date<=as.Date("02/02/2007", format="%d/%m/%Y"),]
# Convert  Factor into float 
newData$Global_active_power <- as.numeric(as.character(newData$Global_active_power))

# Plot 2
# get the index of Thu, Fri and Sat
indexOfThu <- 0
indexOfFri <- which(newData$Date > as.Date("01/02/2007", format="%d/%m/%Y"))[1]
indexOfSat <- nrow(newData)

png(file="plot2.png", width = 480, height = 480, bg="transparent")
plot(newData$Global_active_power, type="l", xaxt = "n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(indexOfThu,indexOfFri,indexOfSat), labels=c("Thu","Fri","Sat"))
dev.off()
