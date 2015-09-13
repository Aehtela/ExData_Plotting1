####################################################
#                                                  #
# EXPLORATORY DATA ANALYSIS                        #
#                                                  #
####################################################

########
# PLOT 2 
########

# Plot 2 is a chart plotting Global Active Power across days

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

# Our goal is to produce a chart plotting Global Active Power across the sampling time of interest
# Global_active_power must be coerced into numeric values
PowerConsumption2Day$Global_active_power<- as.numeric(paste(PowerConsumption2Day$Global_active_power))

# Plots the chart and saves it to PNG
png(filename="plot2.png", width=480, height=480)
plot(PowerConsumption2Day$DateTime, PowerConsumption2Day$Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()