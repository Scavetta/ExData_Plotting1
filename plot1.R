# Project 1:
# Plot 1:

# Set your own working directory:
# setwd("~/Documents/Coursera/Data Science/ExplorData/Proj1/")

# Read in data:
df <- read.csv("household_power_consumption.txt", 
               stringsAsFactors=FALSE, 
               check.names=FALSE , 
               comment.char="",
               sep = ";")

# Set time and date correctly:
df$Time <- strptime(df$Time, format = "%H:%M:%S")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Limit to specific range-of-interest
df1 <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

# Take one time point from next day for labelling x-axis:
df <- rbind(df1, df[df$Date == "2007-02-03",][1:2,])
rm(df1) # remove temp df.

# open graphics device
png("./ExData/ExData_Plotting1/plot1.png", height = 480, width = 480, units = "px", bg = "transparent")

# Make plot1, histogram:
hist(as.numeric(df$Global_active_power),
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Close device:
dev.off()
