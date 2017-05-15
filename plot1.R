rm(list = ls())

# load and clean the data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?") 
househould_power_comsumption <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
househould_power_comsumption <- househould_power_comsumption[complete.cases(househould_power_comsumption),]

DateTime <- strptime(paste(househould_power_comsumption$Date, househould_power_comsumption$Time, 
                           sep=" "),"%d/%m/%Y %H:%M:%S")

househould_power_comsumption <- househould_power_comsumption[, c(3:dim(househould_power_comsumption)[2])]
househould_power_comsumption <- cbind(DateTime, househould_power_comsumption)


# plot figure
hist(househould_power_comsumption$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

