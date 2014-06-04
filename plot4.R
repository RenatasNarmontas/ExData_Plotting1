## usage : run command "source('plot4.R')" in R console
## result: plot4.png file in current working directory

## Reading data from CSV file
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=24*60*2, header=FALSE)

## Open screen device (OS Windows)
windows(width=480, height=480)

## Joining data for X axis
dates <- paste(data$V1, data$V2)

## Two rows and two columns for plots
par(mfrow = c(2,2))

## Creating 1st plot on screen device
plot(strptime(dates, "%d/%m/%Y %T"), data$V3, xlab="", ylab="Global Active Power", type="l")

## Creating 2nd plot on screen device
plot(strptime(dates, "%d/%m/%Y %T"), data$V5, xlab="datetime", ylab="Voltage", type="l")

## Creating 3rd plot on screen device
plot(strptime(dates, "%d/%m/%Y %T"), data$V7, xlab="", ylab="Energy sub metering", type="l")
lines(strptime(dates, "%d/%m/%Y %T"), data$V8, col="red")
lines(strptime(dates, "%d/%m/%Y %T"), data$V9, col="blue")
legend("topright", lty = 1, bty = "n", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Creating 4th plot on screen device
plot(strptime(dates, "%d/%m/%Y %T"), data$V4, xlab="datetime", ylab="Global_reactive_power", type="l")

## Copying plots from screen device to a PNG file
dev.copy(png, filename="plot4.png")

## Closing the PNG device
dev.off()