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

# plot 4
png(filename = "plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(mydata,plot(DateTime,Global_active_power,type="l",xlab = "", ylab = "Global Active Power",cex.lab=0.75))
with(mydata,plot(DateTime,Voltage,type="l",xlab = "datetime", ylab = "Voltage",cex.lab=0.75))
with(mydata,plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",cex.lab=0.75,
                 col="black"))
points(mydata$DateTime,mydata$Sub_metering_2,type="l",col="red")
points(mydata$DateTime,mydata$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6,bty="n")
with(mydata,plot(DateTime,Global_reactive_power,type="l",xlab="datetime",cex.lab=0.75))
dev.off()