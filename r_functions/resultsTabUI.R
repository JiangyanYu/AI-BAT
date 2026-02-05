# ---- RESULTS TAB UI ----
resultsTabUI <- function() {

  # ---- FINAL RESULTS TAB ----
  tabPanel(
    title = "Final Results",
    fluidPage(
      fluidRow(
        column(
          width = 12,
          h3("Download Final Results"),
          downloadButton("download_final_results", "Download Data", class = "btn-secondary"),
          br(), br()
        )
      ),

      fluidRow(
        column(
          width = 12,
          h3("Final Results Summary"),
          p("This section displays the final processed outcomes, analysis metrics, or combined summaries."),
          verbatimTextOutput("final_summary"),
          br(),
          h4("Final Results Table"),
          DTOutput("final_results_table")
        )
      ),
      
      br(),
      fluidRow(
        column(
          width = 12,
          h4("Browning score prediction"),
          uiOutput("final_figures_gallery")   # 👈 dynamic plot gallery
        )
      )
    )
  )

}
