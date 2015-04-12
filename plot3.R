##set working directory - NOTE: change to suit your own computer
setwd("C://Work//docs//PaulWork//Data_Science_Course//exploring//week1_ass")

## read in the assignment dataset - NOTE: it has already been downloaded and unzipped
fulldata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

##extract just the two days of readings
febdata <- fulldata[ which(fulldata$Date=='1/2/2007' | fulldata$Date=='2/2/2007'), ]

##convert the required columns to numeric
submetnum1<- as.numeric(as.character(febdata$Sub_metering_1))
submetnum2<- as.numeric(as.character(febdata$Sub_metering_2))
submetnum3<- as.numeric(as.character(febdata$Sub_metering_3))

##merge the numeric columns
plotdata<-cbind(submetnum1,submetnum2,submetnum3)

##plot a line graph with 3 different colours, hide x-axis labels, add y-axis label
matplot(plotdata,type="l",col = c("black","red","blue"),xaxt="n",ylab="Energy sub metering")

##add legend
legtxt<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright",legtxt,col = c("black","red","blue"), cex=0.6,lty=1)

##manually add day labels
mtext("Thu",1,line=1, adj = 0)
mtext("Fri",1,line=1)
mtext("Sat",1,line=1, adj = 1)

##export to a png file and close the device
dev.copy(png,'plot3.png')
dev.off()