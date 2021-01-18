#plot6c.R
#Baltimore City, Maryland (fips == "24510")
#Los Angeles County, California (fips == "06037")
library(tidyverse)
setwd("~/cw/data-science/04_Exploratory_Data_Analysis/04_two_case_studies_in_EDA/ExploratoryDataAnalysis_assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# [1] "POINT"    "NONPOINT" "ON-ROAD"  "NON-ROAD"

y <- SCC %>% select("SCC", "EI.Sector")
cities <- NEI %>% filter(fips == "24510" | fips == "06037")
z <- merge(cities, y, by.x="SCC")
x1 <- grepl("vehicle", z[,"EI.Sector"], ignore.case=T)
df <- z[x1,] %>%
    group_by(fips, year) %>%
    summarize(pm25=sum(Emissions)) %>%
    arrange(fips,year)
r <- range(df$pm25)
g <- ggplot(df, aes(x=year, y=pm25))
g + geom_line(aes(color = fips)) + ylim(0,r[2]) +
    scale_color_hue(name = "City", labels=c("06037"="Los Angeles County", "24510"="Baltimore City")) + xlab("Year")  + ylab("PM2.5 Emission(tons)") +
    ggtitle("PM25 Emissions from vehicle in Baltimore City Los Angeles County") +
    theme(plot.title = element_text(hjust = 0.2))

dev.copy(png, filename="plot6.png", width=480, height=480)
dev.off()
