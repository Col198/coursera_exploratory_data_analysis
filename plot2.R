setwd("D:/Documents/Training/Coursera/Data Science/Exploratory Data Analysis")

# Read data
dataAll <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Extract data falling in date range 1/2/2007 - 2/2/2007
data <- subset(dataAll, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


# Create Line Graph for Global Active Power
with(data, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})

# Plot to PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
