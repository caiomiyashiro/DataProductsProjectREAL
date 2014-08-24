library(caret)
library(tuneR)
library(repmis)

source("preProcessAndTrainModel.R")

rfModel <- preProcessAndTrainModel()

shinyServer(
    
    function(input, output){
        output$label <- renderText({
            soundFiles <- readWave(testFiles[[as.numeric(input$options)]])
            segSignal <- soundFiles@left[1:10000]
            play(soundFiles)
            soundFFT <- fft(segSignal)
            freqNames = soundFiles@samp.rate/length(segSignal) * (1 : length(segSignal)/2)[1:230]
            freq <- as.data.frame(t(((2/length(soundFFT)) * abs(soundFFT[1 : length(soundFFT)/2+1]))[1:230]))
            names(freq) <- freqNames
            output$class <- renderText(as.character(predict(rfModel, freq)))
            as.character(strsplit(x = testFiles[[as.numeric(input$options)]],split = "\\.")[[1]][2])
        })
    }
)