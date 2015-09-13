##############################################
# EXPLORATORY DATA ANALYSIS - COURSE PROJECT 1
##############################################

########
# PLOT 1 
########

# Plot 1 is a histogram showing the distribution of Global Active Power

# Set working directory
setwd("~/Dropbox/Statistics/Exploratory Data Analysis/EDA R")

# Upload data into R
PowerConsumption<- read.table("household_power_consumption.txt",header=TRUE, sep=";")

# Subset the data from the dates 2007-02-01 and 2007-02-02
PowerConsumption2Day<- subset(PowerConsumption, PowerConsumption$Date=="1/2/2007" | 
                                PowerConsumption$Date=="2/2/2007")

# Our goal is to produce a histogram showing the distribution of Global Active Power
# In the datatable, this information is contained in the column: Global_active_power
# To plot a histogram, we first need to confirm/coerce this information as numeric values
is.factor(PowerConsumption2Day$Global_active_power)
PowerConsumption2Day$Global_active_power<- as.numeric(paste(PowerConsumption2Day$Global_active_power))
is.numeric(PowerConsumption2Day$Global_active_power)

# Plots the histogram and saves it to PNG
png(filename="plot1.png", width=480, height=480)
hist(PowerConsumption2Day$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()