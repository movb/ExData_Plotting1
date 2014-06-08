idata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data, data$Date == as.Date("2007/02/01") | data$Date == as.Date("2007/02/02"))

data$Global_active_power <- as.numeric(data$Global_active_power)

hist(data$Global_active_power, col="red", 
          main="Global Active Power",xlab="Global Active Power(kilowatts)", ylab="Frequency")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
