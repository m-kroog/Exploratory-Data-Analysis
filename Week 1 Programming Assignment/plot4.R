hpc12 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)[66638:69517, 1:2]
hpc3 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)[66638:69517, 3]
hpc79 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)[66638:69517, 7:9]
hpc5 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)[66638:69517, 5]
hpc4 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)[66638:69517, 4]

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))
plot2 <- as.POSIXct(paste(hpc12$Date, hpc12$Time), format = "%d/%m/%Y %H:%M:%S")
plot(plot2, hpc3, type = "o", pch = ".", xlab = "", ylab = "Global Active Power")
plot(plot2, hpc79$Sub_metering_1, type = "o", pch = ".", xlab = "", ylab = "Energy sub metering")
lines(plot2, hpc79$Sub_metering_2, type = "o", pch = ".", col = "red")
lines(plot2, hpc79$Sub_metering_3, type = "o", pch = ".", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"), cex = 0.75)
plot(plot2, hpc5, type = "o", pch = ".", xlab = "datetime", ylab = "Voltage")
plot(plot2, hpc4, type = "o", pch = ".", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()
