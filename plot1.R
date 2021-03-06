#This Script allows to elaborate the plot 1

# Phase 1. Download and format the file

#We include the link of the file in the object "fileURL"

fileURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Here, lets downloas the file using a curl method.

download.file(fileURL,"data.zip","curl")

#Lets unzip the file in the directory TestR2_Data
unzip(zipfile="Data.zip",exdir="./TestR2_Data")

#Set the directory where the file was unzip.
setwd("./TestR2_Data/")

#Read file from the directory

read.delim("household_power_consumption.txt",sep=";")->text

#Select the date and format the time
text$Date<-as.Date(text$Date,"%d/%m/%Y")
filter(text,text$Date < "2007-02-03")->input
filter(input,input$Date > "2007-01-31")->input
paste(input$Date,input$Time,sep=" ")->T&D
cbind(D_T,input)->input
input$D_T<-strptime(input$D_T,"%Y-%m-%d %H:%M:%S")

#Format the data as numeric
as.numeric(input$Global_active_power)->input$Global_active_power

#Phase 2. Elaborate the graph


png(file="plot1.png",width=480,height=480)
hist(input$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()