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
  
  for(file in id) {
    if (file < 10) {
        frame.data<- read.csv(paste(directory,"/","00",file,".csv",sep=""))
        
    }
    else if (file < 100) {
        frame.data<- read.csv(paste(directory,"/","0",file,".csv",sep=""))
    }
    else {
        frame.data<- read.csv(paste(directory,"/",file,".csv",sep=""))
    }
    if (pollutant=="sulfate") {
        v<-c(v,frame.data$sulfate)
    }
    else {
        v<-c(v,frame.data$nitrate)
    }
  }
  mean(v,na.rm=TRUE)
}