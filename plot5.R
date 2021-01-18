#plot5.R
# Baltimore Vehicle Emission
library(tidyverse)
setwd("~/cw/data-science/04_Exploratory_Data_Analysis/04_two_case_studies_in_EDA/ExploratoryDataAnalysis_assignment")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bol <- NEI %>% filter(fips == "24510")
x1 <- grepl("vehicle", SCC[,"EI.Sector"], ignore.case=T)
scc1 <- SCC[x1,"SCC"]
bolVehicle <- NEI %>% filter(SCC %in% scc1)

tot <- with(bolVehicle, tapply(Emissions, year, sum))
r <- range(tot)
barplot(tot, ylim=c(0,r[2]), main = "Baltimore Vehicle Emission", xlab = "Year", ylab = "PM2.5 Emission(tons)")

dev.copy(png, filename="plot5.png", width=480, height=480)
dev.off()
