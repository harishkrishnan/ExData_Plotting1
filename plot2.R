library(dplyr)
library(lubridate)

# read file
l <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

#filter the time period
m <- filter(l,Date =='1/2/2007' | Date == '2/2/2007')

#modify time
m$DateTime <- dmy(m$Date) + hms(m$Time)

m$DateTime <- as.POSIXlt(m$DateTime)

#plot the graph
png(filename='plot2.png',width=480,height=480,units='px')

plot(m$DateTime,m$Global_active_power
     ,ylab='Global Active Power (kilowatts)', xlab='', type='l')

#close the graphical device
x <-dev.off()
