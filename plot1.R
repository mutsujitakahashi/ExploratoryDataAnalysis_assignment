#plot1.R Total emissions from PM2.5 of the United States from 1999 to 2008
library(tidyverse)
setwd("~/cw/data-science/04_Exploratory_Data_Analysis/04_two_case_studies_in_EDA/ExploratoryDataAnalysis_assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

tot <- with(NEI, tapply(Emissions, year, sum))
r <- range(tot)
barplot(tot, ylim=c(0,r[2]), main = "US Total Emission", xlab = "Year", ylab = "PM2.5 Emission(tons)")

dev.copy(png, filename="plot1.png", width=480, height=480)
dev.off()
