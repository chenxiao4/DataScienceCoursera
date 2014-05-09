corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        read.ulti <- function(file){
                data <- read.csv(paste(directory, "/", file, sep=""))
                data[complete.cases(data$sulfate, data$nitrate),]
        }
        
        cutoff <- function(file){
                
                nrow(read.ulti(file)) > threshold
        }
        
        corrl <- function(file){
                cc <- read.ulti(file)
                cor(cc$sulfate, cc$nitrate)
        }
        files = list.files(directory)
        
        candidate.file <- Filter(cutoff, files)
     
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        if (length(candidate.file) == 0)
                numeric(0)
        else
                sapply(candidate.file, corrl)
        
}