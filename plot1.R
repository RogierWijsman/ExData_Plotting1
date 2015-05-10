library(sqldf)
setwd("C:/Users/Roger/Documents/GitHub/ExData_Plotting1")

data <- read.csv.sql("household_power_consumption.txt", sql = 
                       " select  Date , Time, Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3
        from file 
        where 2=2
            and (date = '1/2/2007' or date = '2/2/2007')
      "
                     , sep = ";")


data1 <- as.numeric(as.character(data$Global_active_power))

png(file= "plot1.png")
hist(data1,main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", freq=TRUE)
dev.off()