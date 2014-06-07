#read file
newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
                      stringsAsFactors=FALSE)

# Subset big file = Feb1 and Feb2
pow<-subset(newFile, Date=="1/2/2007" | Date== "2/2/2007")


# Manipulate Time and date
pow$DateTime <- strptime(paste(pow$Date, pow$Time),format="%d/%m/%Y %H:%M:%S")

# plot 2
png(file="plot2.png", width=480, height=480)
plot(pow$DateTime,pow$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", pch = ".")
lines(pow$DateTime,pow$Global_active_power)
dev.off()



