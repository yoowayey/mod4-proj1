## PLOT 3   

## r = 2,075,259 rows; c = 9
## memory required = r * c * 8 bytes/numeric = 149,418,648 bytes/numeric (~ 142.5 mb)


library(lubridate)

power <- read.table("hpc.txt", skip=66637, nrows = 2880, sep = ";", na.strings = "?") #read only the important rows
colnames(power) <- c("Date", "Time", "Global_active_power", 
                     "Global_reactive_power", "Voltage", "Global_intensity", 
                     "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

power$DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S") #converted character columns for date and time to POSIXlt
power$Wday <- wday(power$DateTime, label = T) #created another column for weekday

par(bg="white")
plot(power$Sub_metering_1, type ="l", axes = F, ann = F)
box()
lines(power$Sub_metering_2, col = "red")
lines(power$Sub_metering_3, col = "blue")
title(ylab="Energy sub metering")
axis(1, at=c(0, 1500, 2890), labels = c("Thu", "Fri", "Sat"))
axis(2, at =c(0, 10, 20, 30))
plotnames <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plotcolors <- c("black", "red", "blue")
legend("topright", plotnames,                                            
       lty=1, col=plotcolors, cex=0.7, pt.cex=0.7) #legend box
dev.copy(png, "plot3.png") #created PNG file
dev.off()