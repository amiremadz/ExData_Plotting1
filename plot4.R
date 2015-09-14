
getwd()

epcdata <- read.csv("household_power_consumption.txt",head=TRUE,sep=";",stringsAsFactors=FALSE, na.strings = "?") 

str(epcdata)

summary(epcdata)

epcdata$Date = as.Date(paste(epcdata$Date,epcdata$Time), format="%d/%m/%Y")

epcdata <- epcdata[ epcdata$Date == "2007-02-01" | epcdata$Date == "2007-02-02",]

str(epcdata)

head(epcdata)


z <- strptime(paste(epcdata$Date,epcdata$Time), format = "%Y-%m-%d %H:%M:%S")


png("plot3.png")


par(mfrow = c(2,2), mar = c(4,4,2,1))

with(epcdata,{
  plot(z,Global_active_power,type="l",ylab="Global Active Power",xlab = "")
  
  plot(z,Voltage,type="l",ylab="Global Active Power",xlab = "datetime")
  
  plot(z,Sub_metering_1,type = "l",lty=1,col="black",
       ylab = "Energy sub metering", xlab = "") #xaxt = "n"
  points(z,Sub_metering_2,type = "l",lty=1,col="red")
  points(z,Sub_metering_3,type = "l",lty=1,col="blue")
  
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black", "red", "blue"),lty=c(1,1,1),bty = "n")
  
  plot(z,Global_reactive_power,type='l',xlab="datetime")
  
})


dev.off()












