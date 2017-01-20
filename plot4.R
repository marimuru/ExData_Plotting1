##Read data
originaldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

##Subset data from dates "2007-02-01" and "2007-02-02"
datasel<-subset(originaldata,(Date=="1/2/2007"|Date=="2/2/2007"))

##Add a column With the date and time
datasel$datetime<-as.POSIXct(paste(datasel$Date, datasel$Time), format="%d/%m/%Y %H:%M:%S")

##Multiple plots
par(mfcol=c(2,2),cex=0.6)

##Plot [1,1]
plot(datasel$datetime,as.numeric(as.character(datasel$Global_active_power)),xlab="",ylab="Global Active Power",type="l")

##Plot [2,1]
plot(datasel$datetime,as.numeric(as.character(datasel$Sub_metering_1)),xlab="",ylab="Energy submettering",type="n")
lines(datasel$datetime,as.numeric(as.character(datasel$Sub_metering_1)))
lines(datasel$datetime,as.numeric(as.character(datasel$Sub_metering_2)),col="red")
lines(datasel$datetime,as.numeric(as.character(datasel$Sub_metering_3)),col="blue")
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

##Plot [1,2]
plot(datasel$datetime,as.numeric(as.character(datasel$Voltage)),type="l",xlab="datetime",ylab="Voltage")

##Plot [2,2]
plot(datasel$datetime,as.numeric(as.character(datasel$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")

##Copy the plot to a png file
dev.copy(png,file="plot4.png",width=480,height=480)

##Close the png device
dev.off()
