# PLOT 2 OF COURSE ASSIGNMENT 1 - EXPLORATORY DATA ANALYSIS
#
# by Alan Araujo
#
# Read in household power data
# Skip first 66637 rows to get to Feb 1 2007 data
# Read in 2880 rows, equivalent of 2 days of 1-min sampling rate
# Do not use header and set own column names and classes

myCols <- c("Date","Time","Global_active_power","Global_reactive_power",
            "Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2",
            "Sub_metering_3")

# Set column classes
myColClasses <- c("character","character","numeric","numeric","numeric"
                  ,"numeric","numeric","numeric","numeric")

pwrdata <- read.csv("ExploreData/household_power_consumption.txt",sep= ";",
                    nrows=2880, skip=66637, header=FALSE, col.names=myCols,
                    na.strings="?",colClasses=myColClasses)

# Create new column for DateTime by concatenating date and time strings
pwrdata$DateTime <- paste(pwrdata$Date,pwrdata$Time,sep=" ")

#Convert character DateTime to POSIXlt
pwrdata$DateTime <- strptime(pwrdata$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Line chart of Global_active_power labeled by week day

# Open up connection to png output with 480x480 pixels size
png(filename="plot2.png",width = 480, height = 480, units = "px")

# Generate Line Chart
plot(pwrdata$DateTime,pwrdata$Global_active_power,
     ylab="Global Active Power (kilowatts)", 
     xlab="",
     type="l"
     )

# Close connection to png
dev.off()