## usage : run command "source('plot3.R')" in R console
## result: plot3.png file in current working directory

## Reading data from CSV file
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=24*60*2, header=FALSE)

## Open screen device (OS Windows)
windows(width=480, height=480)

dates <- paste(data$V1, data$V2)

## Creating plot on screen device
plot(strptime(dates, "%d/%m/%Y %T"), data$V7, xlab="", ylab="Energy sub metering", type="l")
lines(strptime(dates, "%d/%m/%Y %T"), data$V8, col="red")
lines(strptime(dates, "%d/%m/%Y %T"), data$V9, col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copying plot from screen device to a PNG file
dev.copy(png, filename="plot3.png")

## Closing the PNG device
dev.off()