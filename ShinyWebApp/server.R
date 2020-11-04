#####################################################################
#       
#       my first shiny application
#
#       tab1:   takes an inut from slider
#               says whether its odd or even
#
#       tab2:   takes an input from box
#               outputs square of it
#
#       tab3:   a calculator
#               takes two number as input
#               adds, subtracts, multiplies and divides them.
#               displays them
#
#       tab4:   data analysis
#               analysie given data set and display output
#
#       tab5:   data set details
#               data set origin, where we got it
#               and explaination
#
#       tab6:   more details on data set
#               explaination about data set
#               explaination of variables and observation
#               listing observation and variables
#
#       tab7:   author details
#               giving author github link
#               author data and contact info
#
#
#####################################################################

library(shiny)

library(datasets)

my_mpgData <- mtcars
my_mpgData$am <- factor(my_mpgData$am, labels = c("Automatic", "Manual"))



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        
        output$binout <- renderText({
            if(input$count %% 2) "odd" else "even"
        })
        output$txtout <- renderPrint({input$num1 * input$num1})
        
        output$add<- renderPrint({input$number1 + input$number2})
        output$sub<- renderPrint({input$number1 - input$number2})
        output$mul<- renderPrint({input$number1 * input$number2})
        output$div<- renderPrint({input$number1 / input$number2})
        
        
        formulaText <- reactive({
                paste("mpg ~", input$variable)
        })
        
        my_formulaTextPoint <- reactive({
                paste("mpg ~", "as.integer(", input$variable, ")")
        })
        
        my_fit <- reactive({
                lm(as.formula(my_formulaTextPoint()), data=my_mpgData)
        })
        
        output$caption <- renderText({
                formulaText()
        })
        
        output$mpgBoxPlot <- renderPlot({
                boxplot(as.formula(formulaText()), 
                        data = my_mpgData,
                        outline = input$outliers)
        })
        
        output$my_fit <- renderPrint({
                summary(my_fit())
        })
        
        output$mpgPlot <- renderPlot({
                with(my_mpgData, {
                        plot(as.formula(my_formulaTextPoint()))
                        abline(my_fit(), col=2)
                })
        })
        
        

})
