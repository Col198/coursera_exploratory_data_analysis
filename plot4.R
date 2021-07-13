setwd("D:/Documents/Training/Coursera/Data Science/Exploratory Data Analysis")

# Read data
dataAll <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Extract data falling in date range 1/2/2007 - 2/2/2007
data <- subset(dataAll, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


# Create Graphs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
        plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="DateTime")
        plot(Sub_metering_1~Datetime, type="l", ylab="Energy Sub Metering", xlab="D")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="DateTime")
})


# Plot to PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
