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

png("plot3.png")
with(PlotData, plot(Sub_metering_1 ~ DateAndTime, type = "n", ylab = "Energy sub metering", xlab = ""))
with(PlotData, points(Sub_metering_2 ~ DateAndTime, col = "red", type = "l"))
with(PlotData, points(Sub_metering_1 ~ DateAndTime, col = "black", type = "l"))
with(PlotData, points(Sub_metering_3 ~ DateAndTime, col = "blue", type = "l"))
legend("topright", lty = 1, 
                   col = c("black", "red", "blue"),
                  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()