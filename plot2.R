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
png(file="plot2.png",bg="transparent")

plot(reqobs$DateTime,reqobs$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
