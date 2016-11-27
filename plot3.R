# 
# plot3.R -> plot3.png
#
# François-David Lessard
# fdlessard@gmail.com
#
# Novembre 26, 2016
#

# Read data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                  colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc$Date <- strptime(paste(hpc$Date , hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc$Time <- NULL
colnames(hpc)[1] <- "DateTime"
hpc <- subset(hpc, "2007-02-01" <= DateTime & "2007-02-03" > DateTime)

# Plot data
png("plot3.png", width = 480, height = 480, units = "px")
plot(hpc$DateTime, hpc$Sub_metering_1, type = "l", ylim=range(c(hpc$Sub_metering_1,hpc$Sub_metering_2, hpc$Sub_metering_3)),
     xlab = "", ylab = "Energy sub metering", col = "black")
par(new = TRUE)
plot(hpc$DateTime, hpc$Sub_metering_2, type = "l", ylim=range(c(hpc$Sub_metering_1,hpc$Sub_metering_2, hpc$Sub_metering_3)), 
     xlab = "", ylab = "Energy sub metering", col = "red")
par(new = TRUE)
plot(hpc$DateTime, hpc$Sub_metering_3, type = "l", ylim=range(c(hpc$Sub_metering_1,hpc$Sub_metering_2, hpc$Sub_metering_3)), 
     xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", col= c("black", "red", "blue"), lwd=c(1, 1, 1), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.off()