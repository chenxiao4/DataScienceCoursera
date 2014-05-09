source("ulti.R")

plot.two <- function(save = TRUE, col = 3, xtitle = "", ytitle = "Global Active Power (Kilowatts)"){
        
        data1 <- load.file("household_power_consumption.txt")
        data <- file.ulti(data1,col)
        if (save){
                png("plot2.png",width = 480, height = 480)
        }
        plot(seq(nrow(data1)),data, type = "n",xaxt = "n", xlab = xtitle,ylab = ytitle)
        lines(seq(nrow(data1)),data)
        
        
        axis(side = 1, at = c(1,1440,2880), labels = c(dow(data1[1,1],-1),dow(data1[1,1],0),dow(data1[1,1],1)))
        
        if (save){
                dev.off()
        }
}