shinyUI(
    fluidPage(
        titlePanel("Instrument Recognition App"),
        sidebarLayout(
            sidebarPanel(
                p(h2("Please, wait until the first label appears on the right (~15 sec). The classifier
                     is being trained!")),
                p("Instrument detection. See R Presentation for details and data"),
                p("1 - Choose a test instrument. True instrument label is presented and below it
                  the classificator labeling"),
                p("After hearing the sound played, close your media player, so the script can continue!"),
                radioButtons("options", "Test Sounds", 1:10, selected = NULL),
                p(submitButton("sub","Submit"))
                ),
            mainPanel(
                p("Instrument: "),
                textOutput(outputId = "label"),
                p("Instrument Classification: "),
                textOutput(outputId = "class")
            )
                )
)    
    )

