library(sqldf)
library(lubridate)
setwd("C:/Users/Roger/Documents/GitHub/ExData_Plotting1")

data <- read.csv.sql("household_power_consumption.txt", sql = 
                       " select  Date, Time, Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3
                     from file 
                     where 2=2
                     and (date = '1/2/2007' or date = '2/2/2007')
                     ", sep = ";")

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S" )
data$Global_active_power <- as.numeric(as.character(data$Global_active_power)) 
plotInput <- data[,c(10,3)] 

png(file= "plot4.png")
par(mfrow = c(2,2))
with(data,
  {
    ##1##
    plot(DateTime, Global_active_power,  type="l", ylab="Global Active Power",xlab = "")
    
    
    ##2##
    plot(DateTime, Voltage,  type="l", ylab="Voltage",xlab = "datetime")
  
    
    ##3##
    plot(data$DateTime,data$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering",ylim=c(0,30))
    lines(data$DateTime,data$Sub_metering_1)
    lines(data$DateTime,data$Sub_metering_2,col="red")
    lines(data$DateTime,data$Sub_metering_3,col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
           ,lty=c(1,1,1) # gives the legend appropriate symbols (lines)
           ,lwd=c(2.5,2.5)
           ,col=c("black","red","blue")
           ,bty="n" )
    
    ##4##
    plot(DateTime, Global_reactive_power,  type="l", ylab="Global_Active_Power",xlab = "datetime")

    
  }
)

dev.off()