scc <- readRDS("summarySCC_PM25.rds")[, c(4,6)]
sccsum <- with(scc, tapply(Emissions, year, sum))
sccsumdf <- data.frame(Year = names(sccsum), Total.Emissions = sccsum)
plot(sccsumdf)
dev.copy(png, file = "plot1.png")
dev.off()