#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("JB is the fucking master of the world"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("alpha",
                     "Valor del parámetro alpha:",
                     min = -50,
                     max = 50,
                     value = 0)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      alpha = input$alpha
      

            
      library(phaseR)
      FHN <- function(t, y, parameters) {
        alpha <- parameters
        dy <- numeric(2)
        dy[1] <- y[1] *  (alpha * y[1] + y[2] +1) 
        dy[2] <- y[2] * (alpha*y[1] + y[2] - 1)   
        return(list(dy))
      }
      
      phasePlot <- function(FHN, alpha=-1, tmax = 1){
        FHN.flowField  <- flowField(FHN, xlim = c(-3, 3), 
                                    ylim = c(-3, 3),
                                    xlab="v", ylab="w",
                                    main=paste0(expression("a="), alpha),
                                    parameters = alpha, 
                                    points = 15, add = FALSE)  
        FHN.nullclines <- nullclines(FHN, xlim = c(-3, 3), 
                                     ylim = c(-3, 3),
                                     parameters = alpha, 
                                     points = 500)  
        y0 <- matrix(c(-2, -2, 0, 0, 0.5, 0.5), 
                     ncol = 2, nrow = 3, 
                     byrow = TRUE)  
        FHN.trajectory <- trajectory(FHN, y0 = y0, tlim = c(0,tmax),
                                     parameters = alpha)
      }
      
      phasePlot(FHN, alpha= alpha)
      
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

