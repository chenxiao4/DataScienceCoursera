pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        cwd <- getwd()
        
        filename <- function(dir,n){
                
                sprintf("%s/%s/%03d%s",cwd,dir,n,".csv")
        }
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        ave <- numeric(0)
        if (pollutant != "sulfate" & pollutant != "nitrate"){
                print("Error: pollutant is wrong")
        } else {
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
                
                 for (i in id){
                         fname <- filename(directory,i)
                         data <- read.csv(fname)
                         ave <- c(ave,data[!is.na(data[,pollutant]),pollutant])
                
                }
        }

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        round(mean(ave),3)
}