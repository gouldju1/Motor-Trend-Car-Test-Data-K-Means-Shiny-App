library(shiny)
names(mtcars) = c("Miles Per Galon", "Number of Cylinders", "Displacement", "Horsepower", "Rear Axle Ratio", "Weight (1000 lbs)", "1/4-Mile Time (S)", "Engine (0 V-Shaped, 1 Straight)", "Transmission (0 Automatic, 1 Manual)", "Number of Forward Gears", "Number of Carburetors")

function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    mtcars[, c(input$xaxis, input$yaxis)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$KMeansPlot <- renderPlot({
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
}