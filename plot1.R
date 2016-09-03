# Set working directory
setwd("C:/Users/Fredrik/Desktop/Rfiles/Exploratory/")

# Function to read in data
importData <- function(file){
    
    full <- read.table(file,header=T,sep=";",
                       na.strings="?")
    DateTime <- paste(full$Date,full$Time)
    full$DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
    full[,1] <- as.Date(full[,1],"%d/%m/%Y")
    full <- full[full$Date=="2007-02-01" | full$Date=="2007-02-02",]
    full
}

# call importData()
file <- "household_power_consumption.txt"
mydata <- importData(file)

# plot 1, Histogram
png(filename = "plot1.png",width=480,height=480)
with(mydata, hist(Global_active_power, main="Global Active Power",
                  xlab = "Global Active Power (kilowatts)",
                  ylab = "Frequency",col="red"))
dev.off()