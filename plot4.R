
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


### Plot 4:

png(filename='plots/plot4.png',width=480,height=480,units='px')
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(subData, {
  plot(Global_active_power ~ Date_Time, type = "l",
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Date_Time, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Date_Time, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~Date_Time, col ="red")
  lines(Sub_metering_3 ~Date_Time, col ="blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Date_Time, type = "l",
       ylab = "Global_reactive_power", xlab = "datetime")
  
})

dev.off()
