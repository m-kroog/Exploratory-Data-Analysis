scc <- readRDS("summarySCC_PM25.rds")[, c(1,4:6)]
sccsub <- subset(scc, fips == 24510)
sccsplit <- split(sccsub, sccsub$type)
list2env(sccsplit, envir = .GlobalEnv)
nonroad <- with(`NON-ROAD`, tapply(Emissions, year, sum))
nonpoint <- with(NONPOINT, tapply(Emissions, year, sum))
onroad <- with(`ON-ROAD`, tapply(Emissions, year, sum))
point <- with(POINT, tapply(Emissions, year, sum))

nonroaddf <- data.frame(Year = names(nonroad), Total.Emissions = nonroad)
nonpointdf <- data.frame(Year = names(nonpoint), Total.Emissions = nonpoint)
onroaddf <- data.frame(Year = names(onroad), Total.Emissions = onroad)
pointdf <- data.frame(Year = names(point), Total.Emissions = point)

library(tidyr)
sccall <- data.frame(cbind(nonroad, nonpoint, onroad, point))
sccall <- gather(sccall)
colnames(sccall) <- c("type", "Total.Emissions")
Year <- rep(c(1999, 2002, 2005, 2008), times = 4)
sccall <- cbind(sccall, Year)

library(ggplot2)
plotall <- ggplot(data = sccall, aes(x = Year, y = Total.Emissions)) + geom_point(aes(color = type)) + geom_line(aes(color = type, group = type))
plotall
dev.copy(png, file = "plot3.png")
dev.off()