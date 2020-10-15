##-----											-----  
## Exploratory And Data Analysis: Project_1: Plot3
##-----											-----  
dataPath <- "./household_power_consumption.txt"
data <- read.table(dataPath, header = TRUE, sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Plot3
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Sub_metering_1 ~ data$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ data$datetime, col = "Red")
lines(Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1), lwd = c(1, 1))

# Save png file
dev.copy(png, file = "./ExData_Plotting1/plot3.png", width=480, height=480)
dev.off()
detach(data)
