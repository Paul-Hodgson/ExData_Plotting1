##set working directory - NOTE: change to suit your own computer
setwd("C://Work//docs//PaulWork//Data_Science_Course//exploring//week1_ass")

## read in the assignment dataset - NOTE: it has already been downloaded and unzipped
fulldata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

##extract just the two days of readings
febdata <- fulldata[ which(fulldata$Date=='1/2/2007' | fulldata$Date=='2/2/2007'), ]

##convert the required columns to numeric
globnum <- as.numeric(as.character(febdata$Global_active_power))
voltnum <- as.numeric(as.character(febdata$Voltage))
submetnum1<- as.numeric(as.character(febdata$Sub_metering_1))
submetnum2<- as.numeric(as.character(febdata$Sub_metering_2))
submetnum3<- as.numeric(as.character(febdata$Sub_metering_3))
##merge the numeric columns
plotdata<-cbind(submetnum1,submetnum2,submetnum3)

globreacnum <- as.numeric(as.character(febdata$Global_reactive_power))

##set up 4 by 4 grid
par(mfrow = c(2, 2))

##plot a line graph, hide x-axis labels, add y-axis label
plot(globnum, type="l", xlab="",ylab="Global Active Power", xaxt="n", xlim=c(0,3000))

##manually add day labels
mtext("Thu",1,line=1, adj = 0)
mtext("Fri",1,line=1)
mtext("Sat",1,line=1, adj = 1)

##plot a line graph, hide x-axis labels, add y-axis label
plot(voltnum, type="l", xlab="datetime",ylab="Voltage", xaxt="n")

##manually add day labels
mtext("Thu",1,line=1, adj = 0)
mtext("Fri",1,line=1)
mtext("Sat",1,line=1, adj = 1)

##plot a line graph with 3 different colours, hide x-axis labels, add y-axis label
matplot(plotdata,type="l",col = c("black","red","blue"),xaxt="n",ylab="Energy sub metering")

##add legend
legtxt<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright",legtxt,col = c("black","red","blue"), cex=0.4,y.intersp=0.1, lty=1, bty="n")

##manually add day labels
mtext("Thu",1,line=1, adj = 0)
mtext("Fri",1,line=1)
mtext("Sat",1,line=1, adj = 1)

##plot a line graph, hide x-axis labels, add y-axis label
plot(globreacnum, type="l", xlab="datetime",ylab="Global_reactive_power", xaxt="n")

##manually add day labels
mtext("Thu",1,line=1, adj = 0)
mtext("Fri",1,line=1)
mtext("Sat",1,line=1, adj = 1)

##export to a png file and close the device
dev.copy(png,'plot4.png')
dev.off()