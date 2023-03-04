library(shiny)
library(dplyr)
library(plotly)

climate_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")


server <- function(input, output) {
  
  output$energy_plot <- renderPlotly({
    climate_df <- climate_df %>% filter(country %in% input$user_category)
    climate_df <- climate_df %>% filter(year >= input$slider2[1]) 
    climate_df <- climate_df %>% filter(year <= input$slider2[2])
  
  energy_plot <- ggplot(data = climate_df) +
    geom_line(mapping = aes(x = year,
                            y = energy_per_capita,
                            color = country)) +
    labs(
      title = "Comsumption of energy per capita (Kilowatt-hours per person per year)",
      x = "Year",
      y = "Kilowatt-hours/person/year")
  
  my_plotly_plot <- ggplotly(energy_plot)
  return(my_plotly_plot)
})
}
