
## Obtaining the required dataset
fl_data<- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                   na.strings = "?", nrows = 2075259, check.names = F, 
                   stringsAsFactors = F, comment.char = "", quote = '\"')
fl_data$Date <- as.Date(fl_data$Date, format = "%d/%m/%Y")

### Subsetting the data
subData <- subset(fl_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
head(subData) 
rm(fl_data) ## freak out memory

### Converting date time
datetime <- paste(as.Date(subData$Date), subData$Time)
Date_Time <- as.POSIXct(datetime)


### Plot 3: 

png(filename='plots/plot3.png',width=480,height=480,units='px') 

with(subData, {
  plot(Sub_metering_1 ~ Date_Time, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Date_Time, col = 'red')
  lines(Sub_metering_3 ~ Date_Time, col = 'blue')
})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
