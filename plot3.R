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
#third  plot code
with(DataUse, {plot(DateTime, Sub_metering_1, type='l', col='black', ylab='Energy sub metering', xlab='', ylim=c(0,38))
    lines(DateTime, Sub_metering_2, type='l', col='red')
    lines(DateTime, Sub_metering_3, type='l', col='blue')
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'))
    })
#png file code for the third plot
dev.copy(png, file = "plot3.png", width = 480, height =480)
dev.off()