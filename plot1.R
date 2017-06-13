dtr<-fread("household_power_consumption.txt",na.strings=c("?",NA,"NULL"))
dt<- dtr[dtr$Date %in% c("1/2/2007","2/2/2007"), ]
dt$dateTime <-as.POSIXct(paste(dt$Date, dt$Time),format="%d/%m/%Y %H:%M:%S",tz=Sys.timezone())
#par(mfrow=c(1,1))
#plot 1
hist(dt$Global_active_power,main="Global Active Power", xlab = "Gloabal Active Power (kilowatts)", ylab="Frequency", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
