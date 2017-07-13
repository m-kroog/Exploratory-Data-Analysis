hpc3 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)[66638:69517, 3]
gap <- as.numeric(unlist(hpc3))
png(filename = "plot1.png", width = 480, height = 480)
hist(gap, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()