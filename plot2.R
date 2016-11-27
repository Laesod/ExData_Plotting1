# 
# plot2.R -> plot2.png
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
png("plot2.png", width = 480, height = 480, units = "px")
plot(hpc$DateTime, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()