#Exploratory Data Analysis: week 1, plot 2: global active power, line plot
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
subset$Global_active_power = as.numeric(levels(subset$Global_active_power))[subset$Global_active_power]

#determine the start of the day
thu = which(subset$Date == '2007-02-01')[1]
temp = which(subset$Date == '2007-02-02')
fri = temp[1]
sat = temp[length(temp)] + 1

#create and save plot as PNG file
png(filename = 'plot2.png', width = 480, height = 480, bg = 'transparent')
plot(subset$Global_active_power, ylab = 'Global Active Power(kilowatts)', typ = 'l', xaxt='n', xlab = '')
axis(1, at=c(thu,fri,sat), labels=c('Thu', 'Fri', 'Sat'))
dev.off()
