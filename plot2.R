data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, data$Date == as.Date("2007/02/01") | data$Date == as.Date("2007/02/02"))

data$fullDate <- paste(data$Date , " ", data$Time)
data$fullDate <- strptime(data$fullDate, format="%Y-%m-%d  %H:%M:%S")

data$Global_active_power <- as.numeric(data$Global_active_power)

plot(data$fullDate, data$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(data$fullDate, data$Global_active_power)

dev.copy(png, file="Plot2.png", width=480, height=480)
dev.off()