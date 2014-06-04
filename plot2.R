## usage : run command "source('plot2.R')" in R console
## result: plot2.png file in current working directory

## Reading data from CSV file
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=24*60*2, header=FALSE)

## Open screen device (OS Windows)
windows(width=480, height=480)

dates <- paste(data$V1, data$V2)

## Creating plot on screen device
plot(strptime(dates, "%d/%m/%Y %T"), data$V3, xlab="", ylab="Global Active Power (kilowatts)", type="l")

## Copying plot from screen device to a PNG file
dev.copy(png, filename="plot2.png")

## Closing the PNG device
dev.off()