#Exploratory Data Analysis: week 1, plot 4

#General goal
# using data over two dates 2007-02-01 and 2007-02-02
# examine how household energy usage varies
# reconstruct plots which were constructed using the base plotting system


#loads data from the working directory
#create a data frame
data = read.table('household_power_consumption.txt', sep=";", header = TRUE)

#convert the date format
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

#index and subset our choice for analysis days
index = which(data$Date == '2007-02-01' | data$Date == '2007-02-02')
subset = data[index,]
for (i in c(3,4,5,7:8)){
  subset[[i]] = as.numeric(levels(subset[[i]]))[subset[[i]]]
}

#determine the start of the day
thu = which(subset$Date == '2007-02-01')[1]
temp = which(subset$Date == '2007-02-02')
fri = temp[1]
sat = temp[length(temp)] + 1

#start to create 2x2 png plot

png(filename = 'plot4.png', width = 480, height = 480, bg = 'transparent')
colors = c('black', 'blue', 'red')
meter = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

par(mfrow = c(2,2))
plot(subset$Global_active_power, ylab = 'Global Active Power', xaxt='n', xlab = '', type = 'l', lwd = 0.1)
axis(1, at=c(thu,fri,sat), labels=c('Thu', 'Fri', 'Sat'))

plot(subset$Voltage, xlab = 'datetime', ylab = ' Voltage', typ = 'l', xaxt = 'n', lwd = 0.1)
axis(1, at=c(thu,fri,sat), labels=c('Thu', 'Fri', 'Sat'))
  
plot(subset$Sub_metering_1, ylab = 'Energy sub metering', type="l" , xaxt='n', xlab = '', col = 'black', lwd = 0.1)
  with(subset, points(Sub_metering_2, type="l", xaxt='n', xlab = '', col = 'red', lwd = 0.1))
  with(subset, points(Sub_metering_3, type="l", xaxt='n', xlab = '', col = 'blue', lwd = 0.1))
  axis(1, at=c(thu,fri,sat), labels=c('Thu', 'Fri', 'Sat'))
  legend('topright', pch = '-', col = colors, legend = meter, lty=1, lwd=1, bty = 'n')
  
  plot(subset$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', typ = 'l', xaxt = 'n', lwd = 0.1)
  axis(1, at=c(thu,fri,sat), labels=c('Thu', 'Fri', 'Sat'))

dev.off()
