## PLOT 1           

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
hist(power$Global_active_power, #histogram for plot 1
              xlab = "Global Active Power (kilowatts)",
              main = "Global Active Power",
              col = "red", bg = "white")
dev.copy(png, "plot1.png") #created PNG file
dev.off()