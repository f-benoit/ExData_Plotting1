dtr<-fread("household_power_consumption.txt",na.strings=c("?",NA,"NULL"))
dt<- dtr[dtr$Date %in% c("1/2/2007","2/2/2007"), ]
dt$dateTime <-as.POSIXct(paste(dt$Date, dt$Time),format="%d/%m/%Y %H:%M:%S",tz=Sys.timezone())


#plot 3
plot( dt$dateTime, dt$Sub_metering_1, xlab="", ylab="Energy sub metering",type="l",col="black")
lines(dt$dateTime, dt$Sub_metering_2, col="red")
lines(dt$dateTime, dt$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty="solid")
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
