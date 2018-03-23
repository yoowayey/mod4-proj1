## PLOT 2        

## r = 2,075,259 rows; c = 9
## memory required = r * c * 8 bytes/numeric = 149,418,648 bytes/numeric (~ 142.5 mb)


library(lubridate)

power <- read.table("hpc.txt", skip=66637, nrows = 2880, sep = ";", na.strings = "?") #read only the important rows
colnames(power) <- c("Date", "Time", "Global_active_power", 
                     "Global_reactive_power", "Voltage", "Global_intensity", 
                     "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

power$DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S") #converted character columns for date and time to POSIXlt
power$Wday <- wday(power$DateTime, label = T) #created another column for weekday

powerplot2 <- data.frame(power$Wday, power$Global_active_power) #subset of the needed data for plot 2

par(bg="white")
plot(powerplot2$power.Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", 
     ylim=c(0,6),
     xlab = NA,
     axes = F)
axis(1, at=c(0, 1500, 2890), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(0,2,4,6))
box()
dev.copy(png, "plot2.png") #created PNG file
dev.off()