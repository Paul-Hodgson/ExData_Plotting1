##set working directory - NOTE: change to suit your own computer
setwd("C://Work//docs//PaulWork//Data_Science_Course//exploring//week1_ass")

## read in the assignment dataset - NOTE: it has already been downloaded and unzipped
fulldata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

##extract just the two days of readings
febdata <- fulldata[ which(fulldata$Date=='1/2/2007' | fulldata$Date=='2/2/2007'), ]

##convert the required column to numeric
globnum <- as.numeric(as.character(febdata$Global_active_power))

##create a histogram on screen to check that it matches with the sample (breaks at 0.5 intervals, red bars, change main and X labels, y-axis to 1200)
hist(globnum, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200))

##export to a png file and close the device
dev.copy(png,'plot1.png')
dev.off()
