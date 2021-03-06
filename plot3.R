#Exploratory Data Analysis: week 1, plot 3: submetering line plot
# examine how household energy usage varies
# using data over two dates 2007-02-01 and 2007-02-02


#loads data from the working directory
#create a data frame
data = read.table('household_power_consumption.txt', sep=";", header = TRUE)

#convert the date format
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

#index and subset our choice for analysis days
index = which(data$Date == '2007-02-01' | data$Date == '2007-02-02')
subset = data[index,]
for (i in 7:8){
subset[[i]] = as.numeric(levels(subset[[i]]))[subset[[i]]]
}

#determine the start of the day
thu = which(subset$Date == '2007-02-01')[1]
temp = which(subset$Date == '2007-02-02')
fri = temp[1]
sat = temp[length(temp)] + 1

#start to create png plot
png(filename = 'plot3.png', width = 480, height = 480, bg = 'transparent')
colors = c('black', 'blue', 'red')
meter = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
#create baseplot
with(subset, plot(Sub_metering_1, ylab = 'Energy Submetering', type="l" , xaxt='n', xlab = '', col = 'black')) 
#add plot elements
with(subset, points(Sub_metering_2, type="l", xaxt='n', xlab = '', col = 'red')) 
with(subset, points(Sub_metering_3, type="l", xaxt='n', xlab = '', col = 'blue'))
axis(1, at=c(thu,fri,sat), labels=c('Thu', 'Fri', 'Sat'))
legend('topright', pch = '-', col = colors, legend = meter, lty=1, lwd=1)
dev.off()
