##read in all data
all_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE,strip.white = TRUE, na.strings = c("?") )

##subset data based on date
my_data<-subset(all_data, grepl("^(1|2)/2/2007", Date))

##create new date variable
datetime<-as.POSIXct(paste(my_data$Date, my_data$Time), format="%d/%m/%Y %H:%M:%S")

##add new date variable to my_data
my_data<-cbind(datetime,my_data)

#open graphics device
png(file = "plot3.png")

plot(my_data$datetime,my_data$Sub_metering_3, type="l",ylim=c(0,30),xlab="",ylab="Energy sub metering", col="blue")

##don't start new graph
par(new=T)

##sub metering 2 line 
plot(my_data$datetime,my_data$Sub_metering_2, type="l",ylim=c(0,30),xlab="", ylab="",col="red")

par(new=T)

##sub metering 3 line 
plot(my_data$datetime,my_data$Sub_metering_1, type="l",ylim=c(0,30),xlab="", ylab="",col="black")

##add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red", "blue"),cex=0.75)

#close graphics device
dev.off()