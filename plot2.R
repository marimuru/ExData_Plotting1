##Read data
originaldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

##Subset data from dates "2007-02-01" and "2007-02-02"
datasel<-subset(originaldata,(Date=="1/2/2007"|Date=="2/2/2007"))

##Add a column With the date and time
datasel$datetime<-as.POSIXct(paste(datasel$Date, datasel$Time), format="%d/%m/%Y %H:%M:%S")

##Plot
plot(datasel$datetime,as.numeric(as.character(datasel$Global_active_power)),xlab="",ylab="Global Active Power (kilowatts)",type="l")

##Copy the plot to a png file
dev.copy(png,file="plot2.png",width=480,height=480)

##Close the png device
dev.off()
