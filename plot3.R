
# Read data 
Data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header =TRUE,stringsAsFactors = FALSE)

# Convert the Date to Date class and Time to Posix.  
Data$Time<-as.POSIXct(paste(Data$Date,Data$Time,sep=" "),format="%d/%m/%Y %H:%M:%OS")
Data$Date<-as.Date(Data$Date,format="%d/%m/%Y")

# Subset data to only consider dates 2007-02-01 and 2007-02-02. 
DataUse<-subset(Data,Date>=as.Date('2007-02-01') & Date <as.Date('2007-02-03')  )

# Set up png plotting device
png(filename = "plot3.png",  width = 480, height = 480 , units = "px")

# Plot3: Energy by usage area 2007-02-01 -> 2007-02-02
with(DataUse,plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(DataUse,lines(Time,Sub_metering_2,type="l",col="red"))
with(DataUse,lines(Time,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=rep(1,3))

# close plotting device
dev.off()




