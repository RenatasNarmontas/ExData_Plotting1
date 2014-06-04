## usage : run command "source('plot1.R')" in R console
## result: plot1.png file in current working directory

## Reading data from CSV file
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=24*60*2, header=FALSE)

## Open screen device (OS Windows)
windows(width=480, height=480)

## Creating histogram on screen device
hist(data$V3, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## Copying plot from screen device to a PNG file
dev.copy(png, filename="plot1.png")

## Closing the PNG device
dev.off()