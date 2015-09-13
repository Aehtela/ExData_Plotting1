####################################################
#                                                  #
# EXPLORATORY DATA ANALYSIS                        #
#                                                  #
####################################################

########
# PLOT 4 
########

# Plot 4 is a combined plot of 4 charts 
# It includes the previous 2 charts (Plot 2 and 3), as well as charts showing the measured voltage across days
# as well as the global_reactive_power across days

# Set working directory
setwd("~/Dropbox/Statistics/Exploratory Data Analysis/EDA R")

# Upload data into R
PowerConsumption<- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE)

# Subset the data from the dates 2007-02-01 and 2007-02-02
PowerConsumption2Day<- subset(PowerConsumption, PowerConsumption$Date=="1/2/2007" | 
                                PowerConsumption$Date=="2/2/2007")

# Merge the Date and Time columns to create a Date/Time variable
PowerConsumption2Day$DateTime<- paste(PowerConsumption2Day$Date, PowerConsumption2Day$Time, sep=" ")
# Convert the column to a Date/Time class
PowerConsumption2Day$DateTime<- strptime(PowerConsumption2Day$DateTime, format="%d/%m/%Y %H:%M:%S")

# Coerce all variables to be plotted into numeric values
PowerConsumption2Day$Global_active_power<- as.numeric(paste(PowerConsumption2Day$Global_active_power))
PowerConsumption2Day$Sub_metering_1<- as.numeric(paste(PowerConsumption2Day$Sub_metering_1))
PowerConsumption2Day$Sub_metering_2<- as.numeric(paste(PowerConsumption2Day$Sub_metering_2))
PowerConsumption2Day$Voltage<- as.numeric(paste(PowerConsumption2Day$Voltage))
PowerConsumption2Day$Global_reactive_power<- as.numeric(paste(PowerConsumption2Day$Global_reactive_power))

# Plots the 4 charts and saves it to PNG
png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(PowerConsumption2Day$DateTime, PowerConsumption2Day$Global_active_power, type="l", 
     ylab = "Global Active Power", xlab="")
plot(PowerConsumption2Day$DateTime, PowerConsumption2Day$Sub_metering_1, type="l", 
     ylab = "Energy sub metering", xlab="")
lines(PowerConsumption2Day$DateTime, PowerConsumption2Day$Sub_metering_2, col="red")
lines(PowerConsumption2Day$DateTime, PowerConsumption2Day$Sub_metering_3, col="blue")
legend("topright", lty=1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), bty="n")
plot(PowerConsumption2Day$DateTime, PowerConsumption2Day$Voltage, type="l", 
     ylab = "Voltage", xlab="datetime")
plot(PowerConsumption2Day$DateTime, PowerConsumption2Day$Global_reactive_power, type="l", 
     ylab = "Global_reactive_power", xlab="datetime")
dev.off()