hpc12 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)[66638:69517, 1:2]
hpc79 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)[66638:69517, 7:9]
plot2 <- as.POSIXct(paste(hpc12$Date, hpc12$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
plot(plot2, hpc79$Sub_metering_1, type = "o", pch = ".", xlab = "", ylab = "Energy sub metering")
lines(plot2, hpc79$Sub_metering_2, type = "o", pch = ".", col = "red")
lines(plot2, hpc79$Sub_metering_3, type = "o", pch = ".", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
                                legend = c("Sub_metering_1", "Sub_metering_2", 
                                           "Sub_metering_3"), cex = 0.75)

dev.copy(png, file = "plot3.png")
dev.off()