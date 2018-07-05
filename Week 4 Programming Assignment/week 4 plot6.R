scc <- readRDS("summarySCC_PM25.rds")[, c(1,2,4,6)]
sourcescc <- readRDS("Source_Classification_Code.rds")
sourcescc <- sourcescc[, c(1, 3)]
sourcescc <- sourcescc[grepl("motor", sourcescc$Short.Name, ignore.case = T),]
sourcescc <- sourcescc[1]
sourcescc <- scc[scc$SCC %in% sourcescc$SCC, ]

sccsubbc <- subset(sourcescc, fips == 24510)
sccsubla <- subset(sourcescc, fips == "06037")

sccsumbc <- with(sccsubbc, tapply(Emissions, year, sum))
sccsumla <- with(sccsubla, tapply(Emissions, year, sum))

sccsumdfbc <- data.frame(Year = names(sccsumbc), Total.Emissions = sccsumbc)
sccsumdfla <- data.frame(Year = names(sccsumla), Total.Emissions = sccsumla)

sccall <- data.frame(rbind(sccsumdfbc, sccsumdfla))
fips <- rep(c(24510, "06037"), each = 4)
sccall <- cbind(sccall, fips)

library(ggplot2)
plotall <- ggplot(data = sccall, aes(x = Year, y = Total.Emissions)) + geom_point(aes(color = fips)) + geom_line(aes(color = fips, group = fips))
plotall
dev.copy(png, file = "plot6.png")
dev.off()