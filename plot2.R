##read dataset
data_set <- read.csv("./Data/exploring/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_set$Date <- as.Date(data_set$Date, format="%d/%m/%Y")

data1 <- subset(data_set, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting time and data
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Plotting
plot(data1$Global_active_power~data1$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()