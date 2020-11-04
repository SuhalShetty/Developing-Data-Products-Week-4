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

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        navbarPage(
            "Mathriks",
            tabPanel("Odd/Even",
                     titlePanel("Odd Even Finder"),
                     sidebarPanel(
                         sliderInput("count",
                                     "Value:",
                                     min = 1,
                                     max = 100,
                                     value = 18),
                     ),
                     
                     mainPanel(
                         h3("Is the number on slider even or odd?"),
                         verbatimTextOutput("binout"),
                         h5("created by: Suhal S Shetty")
                     )
            ),
            
            
            tabPanel("Square",
                     titlePanel("Squarer Application"),
                     sidebarPanel(
                         tags$h3("Enter Number"),
                         numericInput("num1", "enter number:", "2"),
                         
                     ),
                     
                     mainPanel(
                         h3("Square of number"),
                         verbatimTextOutput("txtout"),
                     )
            ),
            
            tabPanel("Calculator",
                     titlePanel("Maths Calculator"),
                     sidebarPanel(
                         tags$h3("Enter Number (a)"),
                         numericInput("number1", "enter number:", "1996"),
                         tags$h3("Enter Number (b)"),
                         numericInput("number2", "enter number:", "1999"),
                         
                     ),
                     
                     mainPanel(
                         h4("Addition (a+b)"),
                         verbatimTextOutput("add"),
                         h4("subtraction (a-b)"),
                         verbatimTextOutput("sub"),
                         h4("multiplication a*b"),
                         verbatimTextOutput("mul"),
                         h4("division (a/b)"),
                         verbatimTextOutput("div"),
                     ),
            ),   
                     
                     tabPanel("Analysing the data",
              
                                titlePanel("The relationship between variables and miles per gallon (MPG)"),
                                
                                  sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Number of cylinders" = "cyl",
                                                  "Displacement (cu.in.)" = "disp",
                                                  "Gross horsepower" = "hp",
                                                  "Rear axle ratio" = "drat",
                                                  "Weight (lb/1000)" = "wt",
                                                  "1/4 mile time" = "qsec",
                                                  "V/S" = "vs",
                                                  "Transmission" = "am",
                                                  "Number of forward gears" = "gear",
                                                  "Number of carburetors" = "carb"
                                                )),
                                    
                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                  ),
                                  
                                  mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                                tabPanel("Regression model", 
                                                         plotOutput("mpgPlot"),
                                                         verbatimTextOutput("my_fit")
                                                )
                                    )
                                  )
                                
                          
                     ),
                     tabPanel("Data Details",
                              
                              h3("Regression Models from data science specialization on coursera"),
                              helpText("You work for Motor Trend, a magazine about the automobile industry Looking at a data set of a collection of cars, they are interested in exploring the relationship",
                                       "between a set of variables and miles per gallon (MPG) (outcome). They are particularly interested in the following two questions: which is more efficient automatic or manual. Quantify the MPG difference between automatic and manual transmissions"),
                              h3("Important"),
                              p("All ovservation and variavles are listed"),
                              
                              a("https://class.coursera.org/regmods-008")
                     ),
                     tabPanel("See More",
                              h2("Data obtained from web"),
                              hr(),
                              h3("Description"),
                              helpText("These data are published on different magazines and also on wikipedia",
                                       " Here we compare data of automatic and manual car performance",
                                       " for all the models available on net."),
                              h3("Format"),
                              p("This data set had variables which are stated below"),
                              
                              p("  [, 1]   mpg         Miles/(US) gallon"),
                              p("  [, 2]	 cyl	 Number of cylinders"),
                              p("  [, 3]	 disp	 Displacement (cu.in.)"),
                              p("  [, 4]	 hp	 Gross horsepower"),
                              p("  [, 5]	 drat	 Rear axle ratio"),
                              p("  [, 6]	 wt	 Weight (lb/1000)"),
                              p("  [, 7]	 qsec	 1/4 mile time"),
                              p("  [, 8]	 vs	 V/S"),
                              p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                              p("  [,10]	 gear	 Number of forward gears"),
                              p("  [,11]	 carb	 Number of carburetors"),
                              
                              h3("Source"),
                              
                              p("tech magazines and encyclopedias")
                     ),
                     tabPanel("Author Github Details",
                              a("https://github.com/SuhalShetty/Developing-Data-Products-Week-4"),
                              hr(),
                              h4("This is my first shiny app, Please like and Support"),
                              h4("I saved this in my github: SuhalShetty")
                     )
                     
                     
            )
        )
    )
