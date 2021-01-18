#plot4.R
# Coal & Combustion related pm2.5
library(tidyverse)
setwd("~/cw/data-science/04_Exploratory_Data_Analysis/04_two_case_studies_in_EDA/ExploratoryDataAnalysis_assignment")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

x1 <- grepl("comb", SCC[,"Short.Name"], ignore.case=T)
x2 <- grepl("coal", SCC[,"Short.Name"], ignore.case=T)
scc1 <- SCC[x1 & x2,"SCC"]
coal <- NEI %>% filter(SCC %in% scc1)
tot <- with(coal, tapply(Emissions, year, sum))
r <- range(tot)
barplot(tot, ylim=c(0,r[2]), main = "Coal & Combustion related pm2.5", xlab = "Year", ylab = "PM2.5 Emission(tons)")

dev.copy(png, filename="plot4.png", width=480, height=480)
dev.off()
