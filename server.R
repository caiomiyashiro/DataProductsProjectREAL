library(caret)
library(shiny)
library(e1071)
library(randomForest)
library(repmis)

source("preProcessAndTrainModel.R")

rfModel <- preProcessAndTrainModel()

shinyServer(
    
    function(input, output){
        output$label <- renderText({
            soundFiles <- testFiles[as.numeric(input$options),]
            output$class <- renderText(as.character(predict(rfModel, soundFiles)))
            as.character(testFiles[as.numeric(input$options),]$class)
        })
    }
)