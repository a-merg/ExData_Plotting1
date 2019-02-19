## Read in data

PowerData <- read.table("./household_power_consumption.txt", 
                        header = TRUE, 
                        sep = ";", 
                        na.strings = "?")

## Subset for designated rows

PlotData <- subset(PowerData, Date %in% c("1/2/2007", "2/2/2007"))

## Set Date column to date format

PlotData$Date <- as.Date(PlotData$Date, format = "%d/%m/%Y")

## Concatenate Date and Time columns and store in new column

PastedTime <- paste(PlotData$Date, PlotData$Time, sep = " ")
PlotData$DateAndTime <- as.POSIXct(PastedTime)

## Run plot

png("plot2.png")
with(PlotData, plot(Global_active_power ~ DateAndTime, 
                    type = "l", 
                    xlab = "", 
                    ylab = "Global Active Power (kilowatts)"))
dev.off()

