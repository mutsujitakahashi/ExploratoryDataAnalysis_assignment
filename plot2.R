#plot2.R Baltimore City, Maryland (fips == "24510")
library(tidyverse)
setwd("~/cw/data-science/04_Exploratory_Data_Analysis/04_two_case_studies_in_EDA/ExploratoryDataAnalysis_assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
                                  # Baltimore City, Maryland (fips == "24510")
z <- NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarise(s = sum(Emissions))
z1 <- z$s
names(z1) <- as.factor(z$year)
 r <- range(z1)
barplot(tot, main = "Baltimore City Total Emission", xlab = "Year", ylab = "PM2.5 Emission(tons)", ylim=c(0,r[2]))

dev.copy(png, filename="plot2.png", width=480, height=480)
dev.off()
