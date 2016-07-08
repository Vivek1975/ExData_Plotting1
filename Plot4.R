data <- read.csv("household_power_consumption.txt",, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
req_data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
par(mfrow=c(2,2), mar=c(4,2,2,2))
with(req_data, {
  plot(Datetime, Global_active_power, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Datetime, Voltage, type="l", 
       ylab="Voltage (volt)", xlab="Datetime")
  plot(Datetime, Sub_metering_1, type="l", 
       ylab="Energy Sub Metering", xlab="")
  lines(Datetime, Sub_metering_2, col='Red')
  lines(Datetime, Sub_metering_3, col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Datetime, Global_reactive_power, type="l", 
       ylab="Global Reactive Power",xlab="Datetime")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()