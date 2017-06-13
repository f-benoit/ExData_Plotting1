dtr<-fread("household_power_consumption.txt",na.strings=c("?",NA,"NULL"))
dt<- dtr[dtr$Date %in% c("1/2/2007","2/2/2007"), ]
dt$dateTime <-as.POSIXct(paste(dt$Date, dt$Time),format="%d/%m/%Y %H:%M:%S",tz=Sys.timezone())


#plot 4
par(mfrow=c(2,2))
with(dt,{
  plot(dt$dateTime, dt$Global_active_power, xlab="", ylab="Global Active Power",type="l", col="black")  
  plot(dt$dateTime, dt$Voltage, xlab="datetime", ylab="Voltage",type="l", col="black")  
  plot( dt$dateTime, dt$Sub_metering_1, xlab="", ylab="Energy sub metering",type="l",col="black")
  lines(dt$dateTime, dt$Sub_metering_2, col="red")
  lines(dt$dateTime, dt$Sub_metering_3, col="blue")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty="solid", bty = "n")
  plot(dt$dateTime, dt$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power",type="l", col="black")  
  
})
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
