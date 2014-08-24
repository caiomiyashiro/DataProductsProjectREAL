preProcessAndTrainModel <- function(){
    
    freqs <- repmis::source_data("http://www.dropbox.com/s/hye8unga4d8n2nz/data.txt",sep = " ", header = T)
    
    trainingIndex <- createDataPartition(freqs$class,p = 0.7,list = FALSE)
    training <- freqs[trainingIndex,]
    testFiles <<- freqs[-trainingIndex,]
    testFiles <<- testFiles[sample(1:nrow(testFiles),nrow(testFiles),replace = F),]
    rfmodel <- randomForest(class ~ ., data=training, importance=TRUE)
}