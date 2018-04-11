#-------------------------------------------------------------
# Coursera Project - Exploratory Data (Graph & Plotting)
# Nikhil Prakash
#
# FILE
#   plot4.R
#
# OVERVIEW 
#       1. Read the household_power_consumption.txt file
#       2. Subset for data taken from 2 days: 2007-02-01 and 2007-02-02
#       3. Generate four plots in single space (GAP vs. time, Vol vs. time, submetering vs. time and GRP vs. time)
#--------------------------------------------------------------
plot4 <- function() {
        ## read data
        powerdata <- read.csv("./household_power_consumption.txt", stringsAsFactors =F, header =T, sep =";", na.strings="?", nrows = 2075259)
        
	  ## subset data from 2007-02-01 and 2007-02-02
        data <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))   
        data$Date <- as.Date(data$Date, format="%d/%m/%Y")
	  datetime <- paste(as.Date(data$Date), data$Time)
	  data$Datetime <- as.POSIXct(datetime)
        
        ## plot graphs
        png("plot4.png", width=480, height=480)
        par(mfrow=c(2,2))
        with(data, plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power"))
        with(data, plot(Voltage~Datetime, type = "l", xlab="datetime", ylab="Voltage"))
	  with(data, 
		{
			plot(Sub_metering_1~Datetime, type="l", ylab="Energy Sub Metering", xlab="")
        		lines(Sub_metering_2~Datetime,col='Red')
        		lines(Sub_metering_3~Datetime,col='Blue')
        	})
	  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	  with(data, plot(Global_reactive_power~Datetime, type="l", xlab="datetime", ylab="Global_reactive_power"))
        dev.off()
}
plot4()

