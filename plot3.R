#read file
newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
                      stringsAsFactors=FALSE)


# Subset big file = Feb1 and Feb2
pow<-subset(newFile, Date=="1/2/2007" | Date== "2/2/2007")




# Manipulate Time and Date
pow$DateTime <- strptime(paste(pow$Date, pow$Time),
                         format="%d/%m/%Y %H:%M:%S")

# plot 3 using different colors 
png(file="plot3.png", width=480, height=480)
plot(pow$DateTime,pow$Sub_metering_1, xlab = "", ylab = "Energy sub metering", pch = ".")                                                                            
lines(pow$DateTime,pow$Sub_metering_1)
lines(pow$DateTime,pow$Sub_metering_2, col = "red")
lines(pow$DateTime,pow$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty =c(1,1), col=c("black", "red", "blue") ) 
dev.off()
