

getwd()

epcdata <- read.csv("household_power_consumption.txt",head=TRUE,sep=";",stringsAsFactors=FALSE, na.strings = "?") 

str(epcdata)

summary(epcdata)

epcdata$Date = as.Date(paste(epcdata$Date,epcdata$Time), format="%d/%m/%Y")

epcdata <- epcdata[ epcdata$Date == "2007-02-01" | epcdata$Date == "2007-02-02",]

str(epcdata)

head(epcdata)


hist(epcdata$Global_active_power, ylim = c(0,1200),
     main = "Global Active Power",col="red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     cex.lab=0.8, cex.axis=0.8, breaks = 12)

#rug(epcdata$Global_active_power)

