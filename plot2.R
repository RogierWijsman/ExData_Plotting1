##library(sqldf)
library(lubridate)
##setwd("C:/Users/Roger/Documents/GitHub/ExData_Plotting1")

data <- read.csv.sql("household_power_consumption.txt", sql = 
                       " select  Date, Time, Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3
        from file 
        where 2=2
            and (date = '1/2/2007' or date = '2/2/2007')
      "
                     , sep = ";")

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S" )
data$Global_active_power <- as.numeric(as.character(data$Global_active_power)) 

plotInput <- data[,c(10,3)] 

png(file= "plot2.png")

plot(plotInput,  type="l", ylab="Global Active Power (kilowatts)",xlab = "")
lines(plotInput)

dev.off()