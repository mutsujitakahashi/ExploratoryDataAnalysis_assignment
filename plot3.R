#plot3.R
#Baltimore City, Maryland (fips == "24510")
library(tidyverse)
setwd("~/cw/data-science/04_Exploratory_Data_Analysis/04_two_case_studies_in_EDA/ExploratoryDataAnalysis_assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
                                        #point, nonpoint, onroad, nonroad
df <- NEI %>% filter(fips == "24510") %>%
    group_by(type, year) %>%
    summarize(pm25=sum(Emissions)) %>%
    arrange(type,year)
r <- range(df$pm25)
g <- ggplot(df, aes(x = year, y = pm25, color=type))
g + geom_line() + ylim(0,r[2]) + xlab("Year") + ylab("PM2.5 Emission(tons)") +
    ggtitle("PM25 emission of Baltimore City for various types") +
    theme(plot.title = element_text(hjust = 0.5))
plot(g)

dev.copy(png, filename="plot3.png", width=480, height=480)
dev.off()
