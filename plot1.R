#Exploratory Data Analysis: week 1, plot 1: global active power, histogram
# examine how household energy usage varies
# using data over two dates 2007-02-01 and 2007-02-02


#load data from the working directory
setwd("C:/Users/Johnny/Desktop/coursera/exploratory data analysis/assignment 1")

#create a data frame
data = read.table('household_power_consumption.txt', sep=";", header = TRUE)

#convert the date format
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

#index and subset our choice for analysis days
index = which(data$Date == '2007-02-01' | data$Date == '2007-02-02')
subset = data[index,]
subset$Global_active_power = as.numeric(levels(subset$Global_active_power))[subset$Global_active_power]

#create and save plot as PNG file
png(filename = 'plot1.png', width = 480, height = 480, bg = 'transparent')
hist(subset$Global_active_power, xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power', col = 'red')
dev.off()

