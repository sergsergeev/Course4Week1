setwd("C:/Users/SS/Desktop/Coursera/Course4Assignment1")


#limiting the input to first 1MM rows for efficiency
electricity <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=1000000, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#only taking 2007 subset from certain dates 
data2007 <- subset(electricity, Date %in% c("1/2/2007","2/2/2007"))


data2007$Date <- as.Date(data2007$Date, format="%d/%m/%Y")


date_time <- paste(as.Date(data2007$Date), data2007$Time)
data2007$date_time <- as.POSIXct(date_time)

## creating a plot
with(data2007, {plot(Sub_metering_1~date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~date_time,col='Red')
    lines(Sub_metering_3~date_time,col='Blue')
})

#adding legend to annotate
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()