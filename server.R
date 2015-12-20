library(ggplot2)
library(ggmap)
library(maps)
data(us.cities)
myLoc <- c(lon = -97.307456, lat = 40.516847)
myMap <- get_map(location = myLoc, source = "google", maptype = "roadmap",
                 crop = FALSE, zoom = 4)
g <- ggmap(myMap, extent = "panel") 

shinyServer(function(input, output) {
    output$map<-renderPlot({
      if(input$dist=="scaled"){
    g + geom_point(aes(x = long, y = lat, size = sqrt(pop)), 
                   color = "darkred",                  
                   data = us.cities[us.cities$pop > input$critPop[1] & us.cities$pop < input$critPop[2],])}
    else {
      g + geom_point(aes(x = long, y = lat, size = 3), 
                     color = "darkred",                  
                     data = us.cities[us.cities$pop > input$critPop[1] & us.cities$pop < input$critPop[2],])}
      
    })
  })