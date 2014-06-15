# Read Data
data <- read.table("household_power_consumption.txt", header=T,sep=";")
# Convert string to Date format
data$Date <- as.Date(data$Date , format="%d/%m/%Y")
# Get the data between 01/02/2007 and 02/02/2007
newData <- data[data$Date>=as.Date("01/02/2007", format="%d/%m/%Y") & data$Date<=as.Date("02/02/2007", format="%d/%m/%Y"),]
# Convert  Factor into float 
newData$Global_active_power <- as.numeric(as.character(newData$Global_active_power))

# Plot 1
png(file="plot1.png", width = 480, height = 480, bg="transparent")
hist(newData$Global_active_power, breaks=12,, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
