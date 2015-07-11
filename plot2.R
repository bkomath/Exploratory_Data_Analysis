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

#### Step 2: Figures

png(filename='plots/plot2.png',width=480,height=480,units='px') 

plot(subData$Global_active_power ~ Date_Time, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
