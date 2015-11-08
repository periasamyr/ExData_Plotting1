## Read file selecting only required dates
## Assume that library(sqldf) is installed

testdata <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", 
                         sql ="select * from file where Date in ('1/2/2007', '2/2/2007') ")

## Transform dataframe columns to time as needed

## Set up graphics device
png(filename = "plot1.png", width = 480, height = 480, units ="px")

## Plot the graph and annotate
hist(result$Global_active_power, col = "red", 
     main  = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Close graphics device
dev.off()