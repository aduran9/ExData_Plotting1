##-----											-----  
## Exploratory And Data Analysis: Project_1: Plot4
##-----											-----  
dataPath <- "./household_power_consumption.txt"
data <- read.table(dataPath, header = TRUE, sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Plot3
data$datetime <- as.POSIXct(data$datetime)
par(mfrow = c(2, 2))
attach(data)
plot(Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power", xlab = "", cex = 0.2)
plot(Voltage ~ data$datetime, type = "l", ylab = "Voltage", xlab = "datetime")
plot(Sub_metering_1 ~ data$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ data$datetime, col = "Red")
lines(Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(Global_reactive_power ~ data$datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# Save png file
dev.copy(png, file = "./ExData_Plotting1/plot4.png", width=480, height=480)
dev.off()
detach(data)

