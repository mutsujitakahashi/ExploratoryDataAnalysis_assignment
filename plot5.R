#plot5.R
# Coal & Combustion related pm2.5
library(tidyverse)
setwd("~/cw/data-science/04_Exploratory_Data_Analysis/04_two_case_studies_in_EDA/ExploratoryDataAnalysis_assignment")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bol <- NEI %>% filter(fips == "24510")
y <- SCC %>% select("SCC", "Short.Name")         
z <- merge(bol, y, by.x="SCC")
x1 <- grepl("vehicle", z[,"Short.Name"], ignore.case=T)
tot <- with(z[x1,], tapply(Emissions, year, sum))
r <- range(tot)
barplot(tot, ylim=c(0,r[2]), main = "Baltimore Vehicle Emission", xlab = "Year", ylab = "PM2.5 Emission(tons)")

dev.copy(png, filename="plot5.png", width=480, height=480)
dev.off()
