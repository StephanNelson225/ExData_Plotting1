#read file
newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
                      stringsAsFactors=FALSE)
names(newFile)
# Subset big file by date =Feb1 Feb2
pow<-subset(newFile,Date=="1/2/2007" | Date=="2/2/2007")


# Create PNG file
png(file="plot1.png", width=480, height=480)
hist(pow$Global_active_power, col = "red", main= "Global Active Power", xlab= "Global Active Power (kilowatts)", ylab= "Frequency")
dev.off()


