scc <- readRDS("summarySCC_PM25.rds")[, c(1,2,4,6)]
sourcescc <- readRDS("Source_Classification_Code.rds")
sourcescc <- sourcescc[, c(1, 3)]
sourcescc <- sourcescc[grepl("motor", sourcescc$Short.Name, ignore.case = T),]
sourcescc <- sourcescc[1]
sourcescc <- scc[scc$SCC %in% sourcescc$SCC, ]
sccsubbc <- subset(sourcescc, fips == 24510)

sccsum <- with(sccsubbc, tapply(Emissions, year, sum))
sccsumdf <- data.frame(Year = names(sccsum), Total.Emissions = sccsum)
plot(sccsumdf)
dev.copy(png, file = "plot5.png")
dev.off()