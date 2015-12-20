library(ggmap)
shinyUI(fluidPage(
  titlePanel("Visualizing most populated cities in United States"),
  sidebarLayout (
    sidebarPanel(
      sliderInput("critPop","Population",
                  min=40000,max=5000000,value=c(40000,1000000)),
      radioButtons("dist", "Size of points:",
                   c("Uniform" = "uniform",
                     "Scaled by population" = "scaled"))
    ),
    mainPanel(
      "This is a simple demonstration of the `shiny` package that visualizes the 
      most populous american cities on a map. With the slider on the left you can choose
      the population range of interest and in the map below you can find the cities 
      with population within that range as red dots. Additionally, with the radio
      buttons you can choose whether to have the size of the points fixed, or to be scaled
      according to the population of a particular city.",
      plotOutput("map",width="800px",height="800px")
    )  
  )))