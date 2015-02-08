#Read Data
file <- "./household_power_consumption.txt"
obs <- read.table(file, header=TRUE,sep=";",na.strings="?", stringsAsFactors = FALSE)
# Convert to Date format
obs$Date <- as.Date(obs$Date, "%d/%m/%Y")
#Subset Data
reqobs <- subset(obs,obs$Date=="2007-02-01")
reqobs <- rbind(reqobs,subset(obs,obs$Date=="2007-02-02"))
#Add new DateTime Column
DateTime <-paste(reqobs$Date,reqobs$Time)
DateTime <-as.POSIXct(DateTime,format="%Y-%m-%d %H:%M:%S")
reqobs <-cbind(reqobs,DateTime)
#Plot Hist and save to png file
png(file="plot1.png",bg="transparent")

hist(reqobs$Global_active_power,col="red", main = "Global Active Power",
     xlab="Global Active Power (kilowatts)",axes=FALSE,breaks=12)
axis(1, at=seq(0,6,by=2), labels=seq(0,6,by=2))
axis(2, at=seq(0,1200,by=200), labels=seq(0,1200,by=200))

dev.off()