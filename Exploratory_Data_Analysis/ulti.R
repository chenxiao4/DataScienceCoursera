load.file <- function(file){
        
        data <- read.table("household_power_consumption.txt",head = TRUE, sep = ";",stringsAsFactors=FALSE,nrows = 1)
        nm <- names(data)
        data <- read.table("household_power_consumption.txt",head = TRUE, sep = ";",stringsAsFactors=FALSE,skip = 66636, nrows = 2880)
        names(data) <- nm
        cri <- (data[,1] == "1/2/2007" | data[,1] == "2/2/2007")
        data[cri,]
}


file.ulti <- function(data,col){
        cri <- data[,col] != "?"
        as.numeric(data[cri,col])
}

dow <- function(date,a = 0){
        b <- as.Date(date,"%d/%m/%Y")
        b <- b+a
        format(b,"%a")
}