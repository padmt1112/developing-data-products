library(shiny)

shinyUI(
  navbarPage("Peer Assessments /Course Project: Shiny Application and Reproducible Pitch",
             tabPanel("Analysis / Outcome",
                      fluidPage(
                        titlePanel("Cars - Relationship between Miles Per Gallon (mpg) (y) and Variable (x)"),
                        sidebarLayout(
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
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Background",
                      h2("Cars - MPG vs Factors"),
                      hr(),
                      h3("Objective"),
                      helpText("Objective of this application is to show the relationship between Miles Per Gallon (mpg) (outcome / dependant variable)",
                               "and Set of variables (input / Independant), which the buyer / user is interested in. Data is from mtcars dataset which is part of default datasets in R package.The same dataset is also used in the Regression Models class for the regression model analysis."),
                                            
                      
                      hr(),
                      h3("About the Data"),
                      helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                               " and comprises fuel consumption and 10 aspects of automobile design and performance",
                               " for 32 automobiles (1973-74 models)."),
                      h3("Data Structure"),
                      p("A data frame with 32 observations on 11 variables.Variables are,"),
                      
                      p("  [, 1]   mpg         Miles/(US) gallon"),
                      p("  [, 2]   cyl   Number of cylinders"),
                      p("  [, 3]	 disp	 Displacement (cu.in.)"),
                      p("  [, 4]	 hp	 Gross horsepower"),
                      p("  [, 5]	 drat	 Rear axle ratio"),
                      p("  [, 6]	 wt	 Weight (lb/1000)"),
                      p("  [, 7]	 qsec	 1/4 mile time"),
                      p("  [, 8]	 vs	 V/S"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of forward gears"),
                      p("  [,11]	 carb	 Number of carburetors"),
                      
                                    
                      h3("Analysis / Outcome"),
                      
                      p("Output consists of two screen: Each screen shows the relationship of mpg and the selected variable"),
                      p("1- Boxplot - shows the variation within and across the specification, for each of the variable."),
                      p("2- Regression Model - Strength and direction of relationship for each variable, in picture as well as regression equation format.")
                )
  )
)