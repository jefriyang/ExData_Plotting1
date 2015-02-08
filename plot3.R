#Read Data
file <- "./household_power_consumption.txt"
obs <- read.table(file, header=TRUE,sep=";",na.strings="?", stringsAsFactors = FALSE)
# Convert to Date/Time format
obs$Date <- as.Date(obs$Date, "%d/%m/%Y")
#Subset Data
reqobs <- subset(obs,obs$Date=="2007-02-01")
reqobs <- rbind(reqobs,subset(obs,obs$Date=="2007-02-02"))
#Add new DateTime Column
DateTime <-paste(reqobs$Date,reqobs$Time)
DateTime <-as.POSIXct(DateTime,format="%Y-%m-%d %H:%M:%S")
reqobs <-cbind(reqobs,DateTime)

#Plot linechart and save to png file
png(file="plot3.png",bg="transparent")

plot(reqobs$DateTime,reqobs$Sub_metering_1,type="n",
     xlab="",ylab="Energy sub metering")
lines(reqobs$DateTime,reqobs$Sub_metering_1,col="black")
lines(reqobs$DateTime,reqobs$Sub_metering_2,col="red")
lines(reqobs$DateTime,reqobs$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.font=2)
dev.off()