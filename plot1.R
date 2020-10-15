##-----											-----  
## Exploratory And Data Analysis: Project_1: Plot1
##-----											-----  
dataPath <- "./household_power_consumption.txt"
data <- read.table(dataPath, header = TRUE, sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Plot1
attach(data)
Globalactivepower <- as.numeric(data$Global_active_power)
hist(Globalactivepower, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Save png file
dev.copy(png, file = "./ExData_Plotting1/plot1.png", width=480, height=480)
dev.off()
detach(data)

