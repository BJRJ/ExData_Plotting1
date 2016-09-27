##########clear console##########################
cat("\014")  
rm(list=ls())


####read data##########################

in_dir<-'C://datascience//exploratory_Data_Analysis//week1'
setwd(in_dir)
in_data<-read.csv("household_power_consumption.txt", header = T, sep = ';', 
                  na.strings = "?", nrows = 2075259, check.names = F, 
                  stringsAsFactors = F, comment.char = "", quote = '\"')

#############convert to date format#################
in_data$Date_new <- as.Date( (in_data$Date), format="%d/%m/%Y")

######subset to 2 days ###################################
subset_data<-subset(in_data, Date_new ==("2007-02-01")|Date_new=="2007-02-02")


##############combine date and time############################3

date_time <- paste(as.Date(subset_data$Date_new), subset_data$Time)
subset_data$date_time <- as.POSIXct(date_time)

###########generate plot and write to png################

png("plot2.png",width=480,height=480)


plot(subset_data$Global_active_power ~ subset_data$date_time, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
