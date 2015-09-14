
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


plot(z,epcdata$Sub_metering_1,type = "l",lty=1,col="black",
     ylab = "Energy sub metering", xlab = "") #xaxt = "n"
points(z,epcdata$Sub_metering_2,type = "l",lty=1,col="red")
points(z,epcdata$Sub_metering_3,type = "l",lty=1,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"),lty=c(1,1,1))


dev.off()








