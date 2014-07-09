# Change working directory
setwd("C:/Users/tkwong/R/ExploratoryDataAnalysis/Project1/")

pConsump <- read.table(unz("./Data/household_power_consumption.zip", "household_power_consumption.txt"),
                               header=T, sep=";")

# Household power consumption for Feb. 1 and 2, 2007 only
pConsump2 <- pConsump[as.character(pConsump$Date) %in% c("1/2/2007", "2/2/2007"),]
# Concatante Date and Time variables
pConsump2$dateTime = paste(pConsump2$Date, pConsump2$Time)

# Convert to Date/Time class
pConsump2$dateTime <- strptime(pConsump2$dateTime, "%d/%m/%Y %H:%M:%S")
attach(pConsump2)

png("plot3.png", width=480, height=480, units="px")
# Plot Energy sub metering
plot(dateTime, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(dateTime, as.numeric(as.character(Sub_metering_2)), col="red")
lines(dateTime, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.off()