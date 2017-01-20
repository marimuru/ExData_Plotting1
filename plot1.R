##Read data
originaldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

##Subset data from dates "2007-02-01" and "2007-02-02"
datasel<-subset(originaldata,(Date=="1/2/2007"|Date=="2/2/2007"))

##Plot
hist(as.numeric(datasel$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

##Copy the plot to a png file
dev.copy(png,file="plot1.png",width=480,height=480)

##Close the png device
dev.off()
