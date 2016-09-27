##########clear console##########################
cat("\014")  
rm(list=ls())

####read data##########################

in_dir<-'C://datascience//exploratory_Data_Analysis//week1'
setwd(in_dir)
in_data<-read.table('household_power_consumption.txt',sep=";",header=T,na.strings = '?')

#############convert to date format#################
in_data$Date_new <- as.Date( (in_data$Date), format="%d/%m/%Y")

######subset to 2 days ###################################
subset_data<-subset(in_data, Date_new ==("2007-02-01")|Date_new=="2007-02-02")

###########generate plot and write to png################
png("plot1.png",width=480,height=480)
hist(as.numeric(as.character(subset_data$Global_active_power)),col="RED",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

