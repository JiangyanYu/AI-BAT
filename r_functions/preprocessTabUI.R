# ---- RESULTS TAB UI ----
preprocessTabUI <- function() {

  fluidPage(
    # Section header
    fluidRow(
      column(
        width = 12,
        h3("Download Processed Data"),
        downloadButton("download_data", "Download Data", class = "btn-secondary"),
        br(), br()
      )
    ),
    
    # ---- FIRST ROW OF PLOTS ----
    fluidRow(
      column(
        width = 4,
        div(
          class = "card shadow-sm mb-3 p-2",
          h4("Normalization per dataset", style = "text-align:center; font-size:14px;"),
          imageOutput("plot1", width = "100%", height = "250px")
        )
      ),
      column(
        width = 4,
        div(
          class = "card shadow-sm mb-3 p-2",
          h4("PCA after normalization", style = "text-align:center; font-size:14px;"),
          imageOutput("plot2", width = "100%", height = "250px")
        )
      ),
      column(
        width = 4,
        div(
          class = "card shadow-sm mb-3 p-2",
          h4("PCA after COMBAT", style = "text-align:center; font-size:14px;"),
          imageOutput("plot3", width = "100%", height = "250px")
        )
      )
    ),
    
    # ---- SECOND ROW OF PLOTS ----
    fluidRow(
      column(
        width = 4,
        div(
          class = "card shadow-sm mb-3 p-2",
          h4("PCA after projection", style = "text-align:center; font-size:14px;"),
          imageOutput("plot4", width = "100%", height = "250px")
        )
      ),
      column(
        width = 4,
        div(
          class = "card shadow-sm mb-3 p-2",
          h4("PCA after imputation", style = "text-align:center; font-size:14px;"),
          imageOutput("plot5", width = "100%", height = "250px")
        )
      ),
      column(
        width = 4,
        div(
          class = "card shadow-sm mb-3 p-2",
          h4("PCA after imputation by tissue", style = "text-align:center; font-size:14px;"),
          imageOutput("plot6", width = "100%", height = "250px")
        )
      )
    )
  )

}
