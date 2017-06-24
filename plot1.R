setwd("C:/Users/SS/Desktop/Coursera/Course4Assignment1")

#limiting the input to first 1MM rows for efficiency
electricity <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=1000000, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#only taking 2007 subset from certain dates 
data2007 <- subset(electricity, Date %in% c("1/2/2007","2/2/2007"))
data2007$Date <- as.Date(data2007$Date, format="%d/%m/%Y")

#creating a histogram
hist(data2007$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()