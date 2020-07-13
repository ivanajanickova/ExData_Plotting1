data <- read.table("household_power_consumption.txt", sep = ";", col.names = c("Date", "time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 1)
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

library(datasets)
hist(as.numeric(data2$Global_active_power), 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     xlim = c(0, 6),
     ylim = c(0, 1200),
     col = "red",
     )

dev.copy(png, "plot1.png")
dev.off()
