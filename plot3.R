## Read file selecting only required dates
## Assume that library(sqldf) is installed

testdata <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", 
                         sql ="select * from file where Date in ('1/2/2007', '2/2/2007') ")

## Transform dataframe columns to time as needed

## Set up graphics device
png(filename = "plot3.png", width = 480, height = 480, units ="px")

## Plot the graph and annotate
plot(strptime(paste(testdata$Date, testdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), 
     testdata$Sub_metering_1, 
     type="l", 
     ylab = "Energy Submetering", 
     xlab="")
lines(strptime(paste(testdata$Date, testdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), 
      testdata$Sub_metering_2, 
      col = "red")        ## incremenentally add submeter 2 to base plot
lines(strptime(paste(testdata$Date, testdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), 
      testdata$Sub_metering_3, 
      col = "blue")        ## incremenentally add submeter 3 to base plot
legend("topright", pch = NA, lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) ## Annotate legend

## Close graphics device
dev.off()