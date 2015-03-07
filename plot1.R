library(dplyr)
library(lubridate)

# load the data

l <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

l <- l[complete.cases(l),]

# convert the date format
l$Date <- dmy(l$Date)
l$Time <- parse_date_time(l$Time,"%H:%M:%S")

# select the time period
m <- filter(l,Date >= '2007-02-01' & Date < '2007-02-03')

#create the plot
png(filename='plot1.png',width=480,height=480,units='px')
hist(as.numeric(m$Global_active_power), main = paste("Global Active Power"),
     xlab = "Global Active Power(Kilowatts)", col = "red")

#close the graphical device
x <-dev.off()