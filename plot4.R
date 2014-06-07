#read file
newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
                      stringsAsFactors=FALSE)
# Subset big file = Feb1 and Feb2
pow<-subset(newFile, Date=="1/2/2007" | Date== "2/2/2007")


# Manipulate Time
pow$DateTime <- strptime(paste(pow$Date, pow$Time),
                         format="%d/%m/%Y %H:%M:%S")

# Plot 4 has some tricky differences with the other plots. 
# The equivalent of plot three has no border around the legend
# Also the x axis labels for the two graphs on the right "datetime" 
# aren't cleaned up and would be better as "Date and Time" Further
# the yaxis label for the bottom right graph is not cleaned up.
# To be consistent with the stlye of plot 1, it should read "Global
# Reactive Power".
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(pow$DateTime,pow$Global_active_power, xlab = "", ylab = "Global Active Power", pch = ".")
lines(pow$DateTime,pow$Global_active_power)
plot(pow$DateTime,pow$Voltage, xlab = "datetime", ylab = "Voltage", pch= ".")
lines(pow$DateTime,pow$Voltage)
plot(pow$DateTime,pow$Sub_metering_1, xlab = "", ylab = "Energy sub metering", pch = ".")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1), col = c("black", "red", "blue"), bty = "n")    
lines(pow$DateTime,pow$Sub_metering_1)
lines(pow$DateTime,pow$Sub_metering_2, col = "red")
lines(pow$DateTime,pow$Sub_metering_3, col = "blue")
plot(pow$DateTime,pow$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",pch = ".")
lines(pow$DateTime,pow$Global_reactive_power)
dev.off()