#-------------------------------------------------------------
# Coursera Project - Exploratory Data (Graph & Plotting)
# Nikhil Prakash
#
# FILE
#   plot3.R
#
# OVERVIEW 
#       1. Read the household_power_consumption.txt file
#       2. Subset for data taken from 2 days: 2007-02-01 and 2007-02-02
#       3. Generate a plot of different submetering vs time
#--------------------------------------------------------------

plot3<- function(){
                
      ## read data
        powerdata <- read.csv("./household_power_consumption.txt", stringsAsFactors =F, header =T, sep =";", na.strings="?", nrows = 2075259) 
                        
      ## subset data from 2007-02-01 and 2007-02-02
        data <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))   
        data$Date <- as.Date(data$Date, format="%d/%m/%Y")
	  datetime <- paste(as.Date(data$Date), data$Time)
	  data$Datetime <- as.POSIXct(datetime)

	## plot globalactivepower vs date&time
        png("plot3.png", width=480, height=480)
        with(data, {
		plot(Sub_metering_1~Datetime, type="l", ylab="Energy Sub Metering", xlab="")
        	lines(Sub_metering_2~Datetime,col='Red')
        	lines(Sub_metering_3~Datetime,col='Blue')
        	})
	  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	  dev.off()
}
plot3()


