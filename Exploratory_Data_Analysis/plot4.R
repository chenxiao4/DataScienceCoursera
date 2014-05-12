source("plot2.R")
source("plot3.R")


plot.four <- function(save = TRUE){
        
        if (save){
                png("plot4.png",width = 480, height = 480)
        }
        par(mfrow = c(2,2))
        plot.two(save = FALSE)  
        plot.two(save = FALSE,col = 5,xtitle = "datetime",ytitle = "Voltage")
        plot.three(save = FALSE,0,"transparent")
        plot.two(save = FALSE,col = 4,xtitle = "datetime",ytitle = "Gobal reactive power")
        
        if (save){
                dev.off()
        }
               
}