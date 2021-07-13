setwd("D:/Documents/Training/Coursera/Data Science/Exploratory Data Analysis")

# Read data
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Extract data falling in date range 1/2/2007 - 2/2/2007
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")


# Create Histogram for Global Active Power
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Plot to PNG
png("plot1.png", width=480, height=480)
dev.off()
