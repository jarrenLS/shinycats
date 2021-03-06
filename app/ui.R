
shinyUI(fluidPage(
    # Title of the Shiny Application
    titlePanel("Logistic Regression Model Builder"),
    # UI
    sidebarLayout(
        # Sidebar UI
        sidebarPanel(
            # Select-box input for response variable of interest
            selectInput("response", 
                        label = "Select the response variable(s) of interest.", 
                        choices = list("Adopted" = "adopted"),
                        selected = "adopted"),
            # Start with the base model that includes the "Intake Type" variable
            radioButtons("base",
                         label = "Start with Intake Type as an explanatory variable.",
                         choices = list("Intake Type" = "Intake.Type"),
                         selected = "Intake.Type"),
            # Checkbox input for explanatory variable(s) of intereset
            checkboxGroupInput("predictor", 
                               label = "Select other explanatory variable(s) of 
                               interest.", 
                               choices = list("Sex" = "Sex.upon.Intake",
                                              "Kitten" = "kitten",
                                              "Juvenile" = "juvenile",
                                              "Young Adult" = "young_adult",
                                              "Adult" = "adult",
                                              "Multicolor" = "multicolor",
                                              "Black" = "black",
                                              "Orange" = "orange",
                                              "Age Upon Intake" = "AgeDaysInt"),
                               selected = c("Sex.upon.Intake",
                                            "kitten",
                                            "juvenile",
                                            "black",
                                            "orange")),
            submitButton("Submit"),
            width = 2),
        
        # Main Panel UI
        mainPanel(
            p("Welcome to the Logistic Regression Model Builder!  This Shiny
              Appliction is based on cat adoption data from the state of Texas.
              To use this application, select explanatory variables of interest
              and observe how they affect the logistic regression model, which
              you can see in a logistic regression plot, a ROC curve, and a
              summary of the model calculations."),
            p("For more information, see the GitHub repository for this project:
              https://github.com/jarrenLS/shinycats"),
            p(),
            # Separate different components into tabular format for cleaner look
            tabsetPanel(
                tabPanel(title = "Logistic Regression Plot",
                         plotOutput("logplot")
                         ),
                tabPanel(title = "ROC Curve",
                         plotOutput("rocplot"),
                         verbatimTextOutput("auc")
                         ),
                tabPanel(title = "Model Calculations",
                         verbatimTextOutput("modelOutput")
                         )
            )
    )
  )
))
