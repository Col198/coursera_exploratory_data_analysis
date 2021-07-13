setwd("D:/Documents/Training/Coursera/Data Science/Exploratory Data Analysis")

# Read data
dataAll <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Extract data falling in date range 1/2/2007 - 2/2/2007
data <- subset(dataAll, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


# Create Graph for Subset Metering
with(data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy Sub Metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
