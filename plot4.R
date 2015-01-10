#verify current directory and change it if necessary
getwd()
# change current directory
setwd('C:/Users/ryUser/Documents/Exploratory_Course_Project 1_data') 
#import data into R
data=read.table('household_power_consumption.txt', header=TRUE, sep= ";", na.strings = "?", dec= ".", strip.white=TRUE, colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric', 'numeric'))
table=as.data.frame(data)
# subsetting of data use corresponding  for two days 2007-02-01 and 2007-02-02
DataUse=subset(table, table $Date=='1/2/2007' | table $Date=='2/2/2007')
# convert date
DataUse$Date = as.Date(DataUse$Date, "%d/%m/%Y")
DataUse$DateTime = as.POSIXct(paste(DataUse$Date, DataUse$Time), format="%Y-%m-%d %H:%M:%S")
# fourth  plot code
par(mfrow=c(2,2))
with(DataUse,{
    plot(DateTime, Global_active_power, type='l', ylab='Global Active Power', xlab='')
    plot(DateTime, Voltage, type='l', xlab='datetime')
    
    plot(DateTime, Sub_metering_1, type='l', col='black', ylab='Energy sub metering', xlab='')
    lines(DateTime, Sub_metering_2, type='l', col='red')
    lines(DateTime, Sub_metering_3, type='l', col='blue')
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'), bty='n')
    
    plot(DateTime, Global_reactive_power, type='l', xlab='datetime')
})
#png file code for the fourth plot
dev.copy(png, file = "plot4.png", width = 480, height =480)
dev.off()
