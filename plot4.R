data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, data$Date == as.Date("2007/02/01") | data$Date == as.Date("2007/02/02"))

data$fullDate <- paste(data$Date , " ", data$Time)
data$fullDate <- strptime(data$fullDate, format="%Y-%m-%d  %H:%M:%S")

par(mfrow=c(2,2))
with(data,{
  with(data,{
    plot(data$fullDate, data$Global_active_power, type="n", xlab="", ylab="Global Active Power")
    lines(data$fullDate, data$Global_active_power)
  })
  with(data,{
    plot(data$fullDate, data$Voltage, type="n", xlab="datetime", ylab="Voltage")
    lines(data$fullDate, data$Voltage)
  })
  with(data,{
    plot(data$fullDate, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(data$fullDate, data$Sub_metering_1, col="black")
    lines(data$fullDate, data$Sub_metering_2, col="red")
    lines(data$fullDate, data$Sub_metering_3, col="blue")
    legend("topright", lty=1, cex=0.5, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })
  with(data,{
    plot(data$fullDate, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
    lines(data$fullDate, data$Global_reactive_power)
  })
})

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()