pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  v<-vector('numeric')
  files<-list.files(directory,full.names=TRUE)
  
  for(file in id) {
    
    frame.data<- read.csv(files[file])
    
    if (pollutant=="sulfate") {
        v<-c(v,frame.data$sulfate)
    }
    else {
        v<-c(v,frame.data$nitrate)
    }
  }
  mean(v,na.rm=TRUE)
}