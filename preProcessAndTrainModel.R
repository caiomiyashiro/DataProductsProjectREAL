preProcessAndTrainModel <- function(){
    
    files <- dir(pattern = "*.wav",full.names = T)
    print(files)
    soundFiles <- readWave(files[1])
    segSignal <- soundFiles@left[1:10000]
    freq = soundFiles@samp.rate/length(segSignal) * (1 : length(segSignal)/2)[1:230]
    
    freqs <- data.frame()
    classes <- as.factor(c(rep("trombone",18),rep("violin",18)))
    for(i in 1:length(files)){
        soundFiles <- readWave(files[i])
        segSignal <- soundFiles@left[1:10000]
        soundFFT <- fft(segSignal)
        freqs <- rbind(freqs, ((2/length(soundFFT)) * abs(soundFFT[1 : length(soundFFT)/2+1]))[1:230])
    }
    freqs <- cbind(freqs, classes)
    names(freqs) <- c(as.character(freq), "class")
    write.table(freqs,"data.txt",row.names = F, col.names = T)
    
    trainingIndex <- createDataPartition(freqs$class,p = 0.7,list = FALSE)
    training <- freqs[trainingIndex,]
    testFiles <<- files[setdiff(1:length(files),trainingIndex)]
    testFiles <<- testFiles[sample(1:length(testFiles),length(testFiles),replace = F)]
    rfmodel <- train(class ~ ., data=training, method="rf", importance=TRUE)    
}