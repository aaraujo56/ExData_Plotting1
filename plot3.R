# PLOT 3 OF COURSE ASSIGNMENT 1 - EXPLORATORY DATA ANALYSIS
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

# Line chart of Sub Metering labeled by week day

# Open up connection to png output with 480x480 pixels size
png(filename="plot3.png",width = 480, height = 480, units = "px")

# Generate Line Chart without plots, so plots can come later
plot(pwrdata$DateTime,pwrdata$Sub_metering_1,
     ylab="Energy sub metering", 
     xlab="",
     type="l"
     )

# Add points for submetering 2 and 3
points(pwrdata$DateTime,pwrdata$Sub_metering_2,col="red",type="l")
points(pwrdata$DateTime,pwrdata$Sub_metering_3,col="blue",type="l")

# Add legend to top right corner
legend( "topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        ,col=c("black","red","blue"),lty=1)

# Close connection to png
dev.off()