### STEP 1: Load appropriate data.
### According to the assignment, 'We will only be using data from the dates 2007-02-01 and 2007-02-02. 
### One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.'

fname <- file("household_power_consumption.txt") # name of the dataset file.
mydata <- read.table(text = grep("^[1,2]/2/2007", readLines(fname), value = TRUE), sep = ";", 
                     col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                                   "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                                   "Sub_metering_3"), header = TRUE)

#### Plot1: Histogram
if (!file.exists('plots')) {
  dir.create('plots')
}
png(filename='plots/plot1.png',width=480,height=480,units='px')

hist(mydata$Global_active_power, col = "red", main = paste("Global Active Power"), 
     xlab = "Global Active Power(kilowatts)")
dev.off()