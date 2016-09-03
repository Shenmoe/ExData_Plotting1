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

# Plot 3
png(filename = "plot3.png",width=480,height=480)
with(mydata,plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",
                 col="black"))
points(mydata$DateTime,mydata$Sub_metering_2,type="l",col="red")
points(mydata$DateTime,mydata$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()