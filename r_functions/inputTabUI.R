inputTabUI <- function() {
  fluidPage(
    fluidRow(
      column(
        width = 8,
        h3("Upload Data"),
        p("Select your input data file below (CSV or RDS format)."),
        fileInput(
          "data_file", "Choose File",
          accept = c(".csv", ".rds"),
          buttonLabel = "Browse...", placeholder = "No file selected"
        ),
        tags$hr(),
        h4("Upload Status"),
        p("Please double check your input file if read_ok is false. read_error provides additional information."),
        verbatimTextOutput("debug_upload"),
        actionButton("run_analysis", "Run Analysis", icon = icon("play"), class = "btn-primary"),
        br(), br(),
        strong(textOutput("analysis_status"))
      ),
      column(
        width = 4,
        h3("Data Preview"),
        p("After uploading and running analysis, a preview of the data will appear here."),
        DTOutput("preview_table"),
        verbatimTextOutput("non_table_preview")
      )
    )
  )
}