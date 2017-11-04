
# Read data 
Data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header =TRUE,stringsAsFactors = FALSE)

# Convert the Date to Date class and Time to Posix.  
Data$Time<-as.POSIXct(paste(Data$Date,Data$Time,sep=" "),format="%d/%m/%Y %H:%M:%OS")
Data$Date<-as.Date(Data$Date,format="%d/%m/%Y")

# Subset data to only consider dates 2007-02-01 and 2007-02-02. 
DataUse<-subset(Data,Date>=as.Date('2007-02-01') & Date <as.Date('2007-02-03')  )

# Set up png plotting device
png(filename = "plot2.png",  width = 480, height = 480 , units = "px")

# Plot2: Global Active Power per minute 2007-02-01 -> 2007-02-02
with(DataUse,plot(Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

# close plotting device
dev.off()

