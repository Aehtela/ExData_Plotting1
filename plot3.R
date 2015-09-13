####################################################
#                                                  #
# EXPLORATORY DATA ANALYSIS                        #
#                                                  #
####################################################

########
# PLOT 3 
########

# Plot 3 is a chart plotting Energy sub metering across days

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

# Our goal is to produce a chart plotting Energy sub metering across days
# In the datatable, this information is contained in the columns: Sub_ metering_1, Sub_ metering_2, and Sub_ metering_3
# To plot a chart, we first need to confirm/coerce this information as numeric values
is.numeric(PowerConsumption2Day$Sub_metering_1)  # FALSE
PowerConsumption2Day$Sub_metering_1<- as.numeric(paste(PowerConsumption2Day$Sub_metering_1))
is.numeric(PowerConsumption2Day$Sub_metering_2)  # FALSE
PowerConsumption2Day$Sub_metering_2<- as.numeric(paste(PowerConsumption2Day$Sub_metering_2))
is.numeric(PowerConsumption2Day$Sub_metering_3)  # TRUE

# Plots the chart and saves it to PNG
png(filename="plot3.png", width=480, height=480)
plot(PowerConsumption2Day$DateTime, PowerConsumption2Day$Sub_metering_1, type="l", 
     ylab = "Energy sub metering", xlab="")
lines(PowerConsumption2Day$DateTime, PowerConsumption2Day$Sub_metering_2, col="red")
lines(PowerConsumption2Day$DateTime, PowerConsumption2Day$Sub_metering_3, col="blue")
legend("topright", lty=1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
dev.off()