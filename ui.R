shinyUI(
    fluidPage(
        titlePanel("Instrument Recognition App"),
        sidebarLayout(
            sidebarPanel(
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


