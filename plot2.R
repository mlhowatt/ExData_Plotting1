##read in all data
all_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE,strip.white = TRUE, na.strings = c("?") )

##subset data based on date
my_data<-subset(all_data, grepl("^(1|2)/2/2007", Date))

##create new date variable
datetime<-as.POSIXct(paste(my_data$Date, my_data$Time), format="%d/%m/%Y %H:%M:%S")

##add new date variable to my_data
my_data<-cbind(datetime,my_data) 

#open graphics device
png(file = "plot2.png")

#create line graph Global active power / days
plot(my_data$datetime,my_data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#close graphics device
dev.off()