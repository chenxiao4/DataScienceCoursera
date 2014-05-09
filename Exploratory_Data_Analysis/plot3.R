source("ulti.R")

plot.three <- function(save = TRUE, lwd = 1, bg = "white"){
        
        data1 <- load.file("household_power_consumption.txt")
        data <- file.ulti(data1,7)
        
        if (save){
                png("plot3.png",width = 480, height = 480)
        }
        
        ##png("plot3.png",width = 480, height = 480)
        
        plot(seq(nrow(data1)),data, type = "n",xaxt = "n", xlab = "",ylab = "Energy sub metering")
        lines(seq(nrow(data1)),data)          
        lines(seq(nrow(data1)),file.ulti(data1,8),col = "red")   
        lines(seq(nrow(data1)),file.ulti(data1,9),col = "blue")        
        axis(side = 1, at = c(1,1440,2880), labels = c("Thu","Fri","Sat"))
        legend("topright",lty = 1, col = c("black","red","blue"),legend = names(data1)[7:9],box.lwd = lwd,bg = bg)
        
        ##dev.copy(png, file = "plot3.png",width = 480, height = 480)
        if (save){
                dev.off()
        }
}