scc <- readRDS("summarySCC_PM25.rds")[, c(2,4,6)]
sourcescc <- readRDS("Source_Classification_Code.rds")
sourcescc <- sourcescc[, c(1, 3, 4)]
sourcescc <- sourcescc[grepl("coal", sourcescc$EI.Sector, ignore.case = T),]
sourcescc <- sourcescc[1]
sourcescc <- scc[scc$SCC %in% sourcescc$SCC, ]

sccsum <- with(sourcescc, tapply(Emissions, year, sum))
sccsumdf <- data.frame(Year = names(sccsum), Total.Emissions = sccsum)
plot(sccsumdf)
dev.copy(png, file = "plot4.png")
dev.off()