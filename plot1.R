#-------------------------------------------------------------
# Coursera Project - Exploratory Data (Graph & Plotting)
# Nikhil Prakash
#
# FILE
#   plot1.R
#
# OVERVIEW
#   This assigment aims at providing the R code required for plotting graphs
#
# Steps 
#   1. read the household_power_consumption.txt file
#   2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
#   3. generate a histogram of global active power(kilowatts)
#--------------------------------------------------------------

plot1<- function(){
                
        ## read data
        powerdata <- read.csv("./household_power_consumption.txt", stringsAsFactors =F, header =T, sep =";", na.strings="?", nrows = 2075259) 
                        
        ## subset data from 2007-02-01 and 2007-02-02
        data <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))   
        data$Date <- as.Date(data$Date, format="%d/%m/%Y")
        ## plot histogram of global active power for those 2 days
        png("plot1.png", width=480, height=480)
        hist(data$Global_active_power, main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",  col="red", border="black",)
        dev.off()
}
plot1()


