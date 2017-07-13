hpc12 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)[66638:69517, 1:2]
hpc3 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)[66638:69517, 3]
plot2 <- as.POSIXct(paste(hpc12$Date, hpc12$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
plot(plot2, hpc3, type = "o", pch = ".", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()