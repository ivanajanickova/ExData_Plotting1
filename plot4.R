data <- read.table("household_power_consumption.txt", sep = ";", col.names = c("Date", "time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 1)
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data3 <- data2

library(chron)

data3$Date <- as.Date(data2$Date, "%d/%m/%Y")
data3$time <- chron(times. = data3$times)

data3$time <- with(data3, ymd(Date) + hms(time))


par(mfrow = c(2, 2))

#first
with(data3, plot(time, Global_active_power, 
                 type = "l", 
                 lty = 1, 
                 ylab =  "Global Active Power (kilowatts)",
                 xlab = "",
                 col = "black"
))

#second
with(data3, plot(time, Voltage, ylab = "Voltage", xlab = "datetime", type = "l", col = "black"))

#third
with(data3, plot(time, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))
lines(data3$time, data3$Sub_metering_2, col = "red", type = "l")
lines(data3$time, data3$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = c(1, 1, 1),
       cex = 0.5,
       bty =  "n"
       )

#fourth
with(data3, plot(time, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l", col = "black"))

dev.copy(png, "plot4.png")
dev.off()