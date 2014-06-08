data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, data$Date == as.Date("2007/02/01") | data$Date == as.Date("2007/02/02"))

data$fullDate <- paste(data$Date , " ", data$Time)
data$fullDate <- strptime(data$fullDate, format="%Y-%m-%d  %H:%M:%S")

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

with(data ,{
  plot(data$fullDate, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(data$fullDate, data$Sub_metering_1, col="black")
  lines(data$fullDate, data$Sub_metering_2, col="red")
  lines(data$fullDate, data$Sub_metering_3, col="blue")
  legend("topright", cex=0.8, lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()