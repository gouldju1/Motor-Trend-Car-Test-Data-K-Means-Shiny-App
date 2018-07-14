library(shiny)
names(mtcars) = c("Miles Per Galon", "Number of Cylinders", "Displacement", "Horsepower", "Rear Axle Ratio", "Weight (1000 lbs)", "1/4-Mile Time (S)", "Engine (0 V-Shaped, 1 Straight)", "Transmission (0 Automatic, 1 Manual)", "Number of Forward Gears", "Number of Carburetors")

pageWithSidebar(
  headerPanel('Motor Trend Car Road Test Data K-Means Clustering'),
  sidebarPanel(
    selectInput('xaxis', 'X-Axis Variable', names(mtcars)),
    selectInput('yaxis', 'Y-Axis Variable', names(mtcars),
                selected=names(mtcars)[[2]]),
    numericInput('clusters', 'Desired Number of Clusters', 2,
                 min = 1, max = 12)
  ),
  mainPanel(
    plotOutput('KMeansPlot')
  )
)