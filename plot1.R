##read dataset
data_set <- read.csv("./R/Data/exploring/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_set$Date <- as.Date(data_set$Date, format="%d/%m/%Y")

## new subset for plot1
data1 <- subset(data_set, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plot Histogram
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()