## Read file selecting only required dates
## Assume that library(sqldf) is installed

testdata <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", 
                         sql ="select * from file where Date in ('1/2/2007', '2/2/2007') ")

## Transform dataframe columns to time as needed

## Set up graphics device
png(filename = "plot2.png", width = 480, height = 480, units ="px")

## Plot the graph and annotate
plot(strptime(paste(testdata$Date, testdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), 
     testdata$Global_active_power, 
     type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab ="")

## Close graphics device
dev.off()