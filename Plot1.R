# Plots total PM2.5 emissions in the years 1999, 2002, 2005, and 2008.
    
#   NEI <- data.table(readRDS("summarySCC_PM25.rds"))
#   SCC <- data.table(readRDS("Source_Classification_Code.rds"))
  byYear<- (NEI %>% group_by(year)  %>% summarise(totalEmissions=sum(Emissions/1e6)))
  plot(byYear$year, byYear$totalEmissions, col="purple4",xlab="Year",
               ylab="Total Emissions(Million Tons)",
               main="Annual United States PM2.5 Emissions")
  lines(byYear$year, byYear$totalEmissions, col=562,pch=22,bg="black", lwd=3)
  dev.copy(png, file = "Plot1.png") 
  dev.off() 