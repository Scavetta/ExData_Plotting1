# Project 1:
# Plot 4:

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
png("./ExData/ExData_Plotting1/plot4.png", height = 480, width = 480, units = "px", bg = "transparent")

# Set up plotting space.
opar <- par(mfrow = c(2,2))

# Make plot4a, time-series:
plot(as.numeric(df$Global_active_power),
     type = "l",
     xaxt = "n",
     xlab = "",
     ylab = "Global Active Power")

axis(1, c(1, nrow(df)/2, nrow(df)), format(df$Date[c(1, nrow(df)/2, nrow(df))], "%a"))



# Make plot4b, time-series:
plot(as.numeric(df$Voltage),
     type = "l",
     xaxt = "n",
     xlab = "datetime",
     ylab = "Voltage")

axis(1, c(1, nrow(df)/2, nrow(df)), format(df$Date[c(1, nrow(df)/2, nrow(df))], "%a"))





# Make plot4c, time-series:
plot(as.numeric(df$Sub_metering_1),
     type = "l",
     ylab = "Energy sub metering",
     xaxt = "n",
     xlab = "")

lines(as.numeric(df$Sub_metering_2),
      col = 2)

lines(as.numeric(df$Sub_metering_3),
      col = 4)

axis(1, c(1, nrow(df)/2, nrow(df)), format(df$Date[c(1, nrow(df)/2, nrow(df))], "%a"))


legend.text <- names(df[7:9])

legend(900,40, # places a legend at the appropriate place 
       legend.text, # puts text in the legend 
       bty = "n",
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       col=c(1, 2, 4)) # gives the legend lines the correct color and width


# Make plot4d, time-series:
plot(as.numeric(df$Global_reactive_power),
     type = "l",
     xaxt = "n",
     xlab = "datetime",
     ylab = "Global Reactive Power")

axis(1, c(1, nrow(df)/2, nrow(df)), format(df$Date[c(1, nrow(df)/2, nrow(df))], "%a"))





par(opar)

# Close device:
dev.off()
