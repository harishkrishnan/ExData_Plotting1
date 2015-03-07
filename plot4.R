library(dplyr)
library(lubridate)

#read data
l <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

#filter the time period
m <- filter(l,Date =='1/2/2007' | Date == '2/2/2007')

#modify the time
m$DateTime <- dmy(m$Date) + hms(m$Time)

m$DateTime <- as.POSIXlt(m$DateTime)

#plot the graphs
png(filename='plot4.png',width=480,height=480,units='px')

par(mfrow = c(2,2))


plot(m$DateTime,m$Global_active_power
     ,ylab='Global Active Power (kilowatts)', xlab='', type='l')


plot(m$DateTime,m$Voltage
     ,ylab='Global Active Power (kilowatts)', xlab='datetime', type='l')

plot(m$DateTime,m$Sub_metering_1
     ,ylab='Energy Sub metering', xlab='', type='n')

lines(m$DateTime,m$Sub_metering_1, type = "l", col = "black")
lines(m$DateTime,m$Sub_metering_2, type = "l", col = "red")
lines(m$DateTime,m$Sub_metering_3, type = "l", col = "blue")
legend('topright', colnames(m)[7:9] , 
       lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)


plot(m$DateTime,m$Global_reactive_power
     , xlab='datetime', type='l')

#close the graphical device
x <-dev.off()
