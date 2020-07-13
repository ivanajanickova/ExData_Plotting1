data <- read.table("household_power_consumption.txt", sep = ";", col.names = c("Date", "time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 1)
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data3 <- data2

library(chron)

data3$Date <- as.Date(data2$Date, "%d/%m/%Y")
data3$time <- chron(times. = data3$times)

data3$time <- with(data3, ymd(Date) + hms(time))

with(data3, plot(time, Global_active_power, 
                 type = "l", 
                 lty = 1, 
                 ylab =  "Global Active Power (kilowatts)",
                 xlab = "",
                 col = "black"
                 ))

dev.copy(png, "plot2.png")
dev.off()