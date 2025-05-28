# UI
ui <- fluidPage(
  # Background image and styling
  tags$head(
    tags$style(HTML("
      body {
        background-image: url('https://th.bing.com/th/id/OIP.UrqCBRgY4nEogRggKEsJwQHaF0?cb=iwp2&rs=1&pid=ImgDetMain');
        background-size: cover;
        background-attachment: fixed;
        background-position: center;
        color: #fff;
        font-family: Arial, sans-serif;
      }

      .well {
        background-color: rgba(0, 0, 0, 0.6);
        padding: 15px;
        border-radius: 10px;
      }

      .header-title {
        text-align: center;
        font-size: 28px;
        font-weight: bold;
        margin-top: 20px;
        margin-bottom: 10px;
        color: #ffffff;
        text-shadow: 2px 2px 4px #000000;
      }

      .subheader-id {
        text-align: center;
        font-size: 20px;
        color: #ffe4e1;
        margin-bottom: 30px;
        text-shadow: 1px 1px 2px #000000;
      }

      .mainPanel, .sidebarPanel {
        background-color: rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        padding: 15px;
      }
    "))
  ),

  div(class = "header-title", "Second Word Predictor (Bigram Model)"),
  div(class = "subheader-id", "Khaled Walid Mohamed Ghalwash - ID: 2205018"),

  sidebarLayout(
    sidebarPanel(
      textInput("first_word", "Enter the first word:", value = ""),
      actionButton("predict_btn", "Predict")
    ),
    mainPanel(
      h3("Predicted Second Words:"),
      verbatimTextOutput("word_output"),
      br(),
      h4("Top 10 Bigrams Overall:"),
      plotOutput("top_bigrams_plot"),
      br(),
      h4("Top Predictions for Entered Word:"),
      plotOutput("predicted_bigrams_plot")
    )
  )
)

# Server
server <- function(input, output) {
  # Static plot of overall top bigrams
  output$top_bigrams_plot <- renderPlot({
    top_bigrams <- bigrams %>%
      unite("bigram", word1, word2, sep = " ") %>%
      top_n(10, wt = n)

    ggplot(top_bigrams, aes(x = reorder(bigram, n), y = n, fill = n)) +
      geom_col(show.legend = FALSE) +
      coord_flip() +
      labs(x = "Bigram", y = "Frequency", title = "Top 10 Bigrams") +
      theme_minimal(base_size = 14) +
      theme(panel.background = element_rect(fill = "white"))
  })

  observeEvent(input$predict_btn, {
    req(input$first_word)
    first_word <- tolower(input$first_word)

    preds <- bigrams %>%
      filter(word1 == first_word) %>%
      arrange(desc(n)) %>%
      head(5)

    output$word_output <- renderText({
      if (nrow(preds) == 0) {
        "No predictions found."
      } else {
        paste(unique(preds$word2), collapse = ", ")
      }
    })

    output$predicted_bigrams_plot <- renderPlot({
      if (nrow(preds) == 0) return(NULL)

      ggplot(preds, aes(x = reorder(word2, n), y = n, fill = word2)) +
        geom_col(show.legend = FALSE) +
        coord_flip() +
        labs(x = "Predicted Word", y = "Frequency", title = paste("Top Predictions for:", first_word)) +
        theme_minimal(base_size = 14) +
        theme(panel.background = element_rect(fill = "white"))
    })
  })
}

shinyApp(ui = ui, server = server)
