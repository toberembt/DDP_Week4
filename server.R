library(shiny)
library(ggplot2)
library(caret)
library(randomForest)

source(file = "model.R")

shinyServer(

  function(input, output, session) {


    decoratedDataStructure <- paste0(dataStructure, collapse = "<br/>")
    output$dataStructure <- renderText({decoratedDataStructure})


    predictMpg <- reactive({

      carToPredict <- data.frame(
        cyl = input$cyl,
        disp = input$disp,
        hp = input$hp,
        drat = input$drat,
        wt = input$wt,
        qsec = input$qsec,
        vs = as.numeric(input$vs),
        am = as.numeric(input$am),
        gear = input$gear,
        carb = input$carb)

      randomForestPredictor(carsRandomForestModelBuilder(), carToPredict)

    })

    output$prediction <- renderTable({
      predictMpg()
    })

  }

)
