source("ulti.R")

plot.one <- function(save = TRUE){
        
        data <- load.file("household_power_consumption.txt")
        data <- file.ulti(data,3)
        ##data <- as.numeric(data[,3])
        if (save){
                png("plot1.png",width = 480, height = 480)
        }
        hist(data, xlab = "Global Active Power (kilowalts)", main = "Global Active Power",col = "red")
        ##dev.copy(png, file = "plot1.png")
        if (save){
                dev.off()
        }
        
}