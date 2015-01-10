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
#seond plot code
with(DataUse, plot(DateTime, Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab=''))
#png file for the second plot
dev.copy(png, file = "plot2.png", width = 480, height =480)
dev.off()