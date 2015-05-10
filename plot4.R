##read in all data
all_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE,strip.white = TRUE, na.strings = c("?") )

##subset data based on date
my_data<-subset(all_data, grepl("^(1|2)/2/2007", Date))

##create new date variable
datetime<-as.POSIXct(paste(my_data$Date, my_data$Time), format="%d/%m/%Y %H:%M:%S")

##add new date variable to my_data
my_data<-cbind(datetime,my_data)

#open graphics device
png(file = "plot4.png")

#attach data in order to refer to variables directly
attach(my_data)

#fix layout
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#create 1st graph 
plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#create 2nd graph
plot(datetime,Voltage,type="l")

#create 3rd graph

plot(my_data$datetime,my_data$Sub_metering_3, type="l",ylim=c(0,30),xlab="",ylab="Energy sub metering", col="blue")

par(new=T)

plot(my_data$datetime,my_data$Sub_metering_2, type="l",ylim=c(0,30),xlab="", ylab="",col="red")

par(new=T)

plot(datetime,Sub_metering_1, type="l",ylim=c(0,30),xlab="", ylab="",col="black")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red", "blue"),cex=0.75)

##create 4th graph
plot(datetime,Global_reactive_power,type="l")

#detach data
detach(my_data)

#close graphics device
dev.off()