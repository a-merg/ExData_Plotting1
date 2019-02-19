## Read in data

PowerData <- read.table("./household_power_consumption.txt", 
                        header = TRUE, 
                        sep = ";", 
                        na.strings = "?")

## Subset for designated rows

PlotData <- subset(PowerData, Date %in% c("1/2/2007", "2/2/2007"))

## Set Date column to date format

PlotData$Date <- as.Date(PlotData$Date, format = "%d/%m/%Y")

## Run plot

png("plot1.png", width = 480, height = 480)
hist(PlotData$Global_active_power, col = "red",
                                   main = "Global Active Power", 
                                   xlab = "Global Active Power (kilowatts)",
                                   ylab = "Frequency")
dev.off()