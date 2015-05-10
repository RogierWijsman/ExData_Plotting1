#library(sqldf)
#library(lubridate)
#setwd("C:/Users/Roger/Documents/GitHub/ExData_Plotting1")

data <- read.csv.sql("household_power_consumption.txt", sql = 
                       " select  Date, Time, Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3
        from file 
        where 2=2
            and (date = '1/2/2007' or date = '2/2/2007')
      "
                     , sep = ";")

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 


png(file= "plot3.png")

plot(data$DateTime,data$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering",ylim=c(0,30))
plot(data$DateTime,data$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering")
lines(data$DateTime,data$Sub_metering_1)
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=c(1,1,1) # gives the legend appropriate symbols (lines)
       ,lwd=c(2.5,2.5)
       ,col=c("black","red","blue"))
dev.off()