
getwd()

epcdata <- read.csv("household_power_consumption.txt",head=TRUE,sep=";",stringsAsFactors=FALSE, na.strings = "?") 

str(epcdata)

summary(epcdata)

epcdata$Date = as.Date(paste(epcdata$Date,epcdata$Time), format="%d/%m/%Y")

epcdata <- epcdata[ epcdata$Date == "2007-02-01" | epcdata$Date == "2007-02-02",]

str(epcdata)

head(epcdata)


z <- strptime(paste(epcdata$Date,epcdata$Time), format = "%Y-%m-%d %H:%M:%S")



plot(z,epcdata$Global_active_power,type = "l",lty=1,
     ylab = "Global Active Power (kilowatts)", xlab = "") #xaxt = "n"













