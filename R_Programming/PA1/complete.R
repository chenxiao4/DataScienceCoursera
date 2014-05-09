complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        cwd <- getwd()
        
        filename <- function(dir,n){
                
                sprintf("%s/%s/%03d%s",cwd,dir,n,".csv")
        }
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        dframe = NULL
        for (i in id){

                fname <- filename(directory,i)
                data <- read.csv(fname, header=TRUE, sep="," )
                comp_case <- complete.cases(data$sulfate, data$nitrate)
                number <- nrow(data[comp_case,])
                dframe <- rbind(dframe,c(i,number))
        }
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        dframe <- as.data.frame(dframe)
        names(dframe) <- c("id","nobs")
        dframe
}