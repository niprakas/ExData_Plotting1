#-------------------------------------------------------------
# Coursera Project - Exploratory Data (Graph & Plotting)
# Nikhil Prakash
#
# FILE
#   plot2.R
#
# OVERVIEW 
#       1. read the household_power_consumption.txt file
#       2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
#       3. generate a plot of global active power vs. time
#--------------------------------------------------------------

plot2<- function(){
                
        ## read data
        powerdata <- read.csv("./household_power_consumption.txt", stringsAsFactors =F, header =T, sep =";", na.strings="?", nrows = 2075259) 
                        
        ## subset data from 2007-02-01 and 2007-02-02
        data <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))   
        data$Date <- as.Date(data$Date, format="%d/%m/%Y")
	  datetime <- paste(as.Date(data$Date), data$Time)
	  data$Datetime <- as.POSIXct(datetime)

## plot globalactivepower vs date&time
        png("plot2.png", width=480, height=480)
        with(data, plot(Global_active_power ~ Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
        dev.off()
}
plot2()



