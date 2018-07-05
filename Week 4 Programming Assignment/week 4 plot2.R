scc <- readRDS("summarySCC_PM25.rds")[, c(1,4,6)]
sccsub <- subset(scc, fips == 24510)
sccsum <- with(sccsub, tapply(Emissions, year, sum))
sccsumdf <- data.frame(Year = names(sccsum), Total.Emissions = sccsum)
plot(sccsumdf)
dev.copy(png, file = "plot2.png")
dev.off()