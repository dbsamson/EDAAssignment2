# Plots total PM2.5 emissions in Baltimore in the years 1999, 2002, 2005, and 2008.
    
#   NEI <- data.table(readRDS("summarySCC_PM25.rds"))
#   SCC <- data.table(readRDS("Source_Classification_Code.rds"))
  byYear<- (NEI[fips==24510] %>% group_by(type, year)   
            %>% summarise(totalEmissions=sum(Emissions/1e3))
            %>% arrange(type, year))
  result<-split(byYear,byYear$type)
  with(result$POINT, plot(year, totalEmissions, col="purple4",xlab="Year",
               ylab="Total Emissions(Thousand Tons)",
               main="Annual Baltimore PM2.5 Emissions by Type"))
#   lines(byYear$year, byYear$totalEmissions, col=491,pch=15, lwd=5)
#   dev.copy(png, file = "Plot3.png") 
#   dev.off()  