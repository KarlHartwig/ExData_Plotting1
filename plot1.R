
# Read data 
Data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header =TRUE,stringsAsFactors = FALSE)

# Convert the Date to Date class and Time to Posix.  
Data$Time<-as.POSIXct(paste(Data$Date,Data$Time,sep=" "),format="%d/%m/%Y %H:%M:%OS")
Data$Date<-as.Date(Data$Date,format="%d/%m/%Y")

# Subset data to only consider dates 2007-02-01 and 2007-02-02. 
DataUse<-subset(Data,Date>=as.Date('2007-02-01') & Date <as.Date('2007-02-03')  )

# Set up png plotting device for plot 1
png(filename = "plot1.png",  width = 480, height = 480 , units = "px")

# Plot 1: histogram of Global Active Power Distribution
hist(DataUse$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

# close plotting device
dev.off()


