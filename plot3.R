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
legend_3 <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colors_3 <- c("black","red","blue")
plot(househould_power_comsumption$DateTime, househould_power_comsumption$Sub_metering_1, 
     type="l", ylab = "Energy sub metering", xlab = "", col = colors_3[1])
lines(househould_power_comsumption$DateTime, househould_power_comsumption$Sub_metering_2, col = colors_3[2])
lines(househould_power_comsumption$DateTime, househould_power_comsumption$Sub_metering_3, col = colors_3[3])
legend("topright", legend = legend_3, col = colors_3, lty = "solid")
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
