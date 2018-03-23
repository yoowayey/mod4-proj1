## PLOT 4   

## r = 2,075,259 rows; c = 9
## memory required = r * c * 8 bytes/numeric = 149,418,648 bytes/numeric (~ 142.5 mb)


library(lubridate)

power <- read.table("hpc.txt", skip=66637, nrows = 2880, sep = ";", na.strings = "?") #read only the important rows
colnames(power) <- c("Date", "Time", "Global_active_power", 
                     "Global_reactive_power", "Voltage", "Global_intensity", 
                     "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

power$DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S") #converted character columns for date and time to POSIXlt
power$Wday <- wday(power$DateTime, label = T) #created another column for weekday


par(mfrow=c(2,2))
par(bg="white")

##Plot 1
plot(power$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", 
     ylim=c(0,6),
     xlab = NA,
     axes = F)
axis(1, at=c(0, 1500, 2890), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(0,2,4,6))
box()

##Plot 2

plot(power$Voltage, type = "l", ylab = "Voltage", xlab = "datetime",
     axes = F)
axis(1, at=c(0, 1500, 2890), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(234, 238, 242, 246))
box()

##Plot 3

plot(power$Sub_metering_1, type ="l", axes = F, ann = F)
box()
lines(power$Sub_metering_2, col = "red")
lines(power$Sub_metering_3, col = "blue")
title(ylab="Energy sub metering")
axis(1, at=c(0, 1500, 2890), labels = c("Thu", "Fri", "Sat"))
axis(2, at =c(0, 10, 20, 30))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"), cex=0.7, pt.cex=0.7)

##Plot 4
plot(power$Global_reactive_power, type = "l", axes = F, ann = F)
title(ylab="Global_reactive_power", xlab="datetime")
axis(1, at=c(0, 1500, 2890), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))
box()

dev.copy(png, "plot4.png") #created PNG file
dev.off()