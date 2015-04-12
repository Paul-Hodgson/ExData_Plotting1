##set working directory - NOTE: change to suit your own computer
setwd("C://Work//docs//PaulWork//Data_Science_Course//exploring//week1_ass")

## read in the assignment dataset - NOTE: it has already been downloaded and unzipped
fulldata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

##extract just the two days of readings
febdata <- fulldata[ which(fulldata$Date=='1/2/2007' | fulldata$Date=='2/2/2007'), ]

##convert the required column to numeric
globnum <- as.numeric(as.character(febdata$Global_active_power))

##plot a line graph, hide x-axis labels, add y-axis label
plot(globnum, type="l", xlab="",ylab="Global Active Power (kilowatts)", xaxt="n", xlim=c(0,3000))

##manually add day labels
mtext("Thu",1,line=1, adj = 0)
mtext("Fri",1,line=1)
mtext("Sat",1,line=1, adj = 1)

##export to a png file and close the device
dev.copy(png,'plot2.png')
dev.off()
