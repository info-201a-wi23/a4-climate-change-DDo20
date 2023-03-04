library(ggplot2)
library(plotly)
library(bslib)

climate_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

overview_tab <- tabPanel(
  "Overview",
  fluidPage(theme = bs_theme(bootswatch = "solar"),
            p(strong("Introduction")),
            p("In this assignment, we will analyze the CO2 and greenhouse gas emissions dataset “Our World in Data” created. This data has many different sources that allow them to collect this data a list of the sources can be found at: https://github.com/owid/co2-data/ . This data was collected in the hopes of making the problem of CO2 and greenhouse gas emissions understandable and accessible to the general public. One limitation I found within the dataset was at a certain year range there is nonexistent data for many countries with added a lot of empty space that used up space within the dataset. Even with the null values in the dataset, there are still tons of valid data that still present a small hurdle of cleaning it up and sorting through it."),
            p(strong("5 relevant values of interest")),
            p("The first value found Qatar's most energy consumed at 317440.50 per capita within the years 1950 - 2020"),
            p("The second Value(s) is the three countries with the lowest amount of energy consumed per capita of all time, which turned out to be Qatar(19430.74)(1966), the United States Virgin Islands(57181.29)(2013), and the United Arab Emirates(4916.535)(1965)."),
            p("The third Value I found most CO2 emissions per capita between 1950 - 2020 was Sint Maarten with 824.457 per capita."),
            p("The third Value I found most CO2 emissions per capita between 1950 - 2020 was Sint Maarten with 824.457 per capita."),
            p("The last value I found was how much Sint Maarten cut down on CO2 emissions per capita, in 2000 it was at 19.341 per capita while at its peak in 1954, it was at 824.457 per capita.")
            )
)

sidebar_plot <- sidebarPanel(
  selectInput(
    inputId = "user_category",
    label = "Country Select",
    choices = climate_df$country,
    selected = "United States",
    multiple = TRUE),
  
  
  sliderInput("slider2", label = "Year slider",
              min = min(climate_df$year),
              max = max(climate_df$year),
              value = c(1950, 2021),
              sep = "",
              step = 10)
)

plot_main <- mainPanel(
  plotlyOutput(outputId = "energy_plot"),
  p("The purpose of this chart is to compare the amount of energy consumed per capita around the world. The user can pick and choose multiple countries that they would like to view and compare how much energy was consumed per capita in each country. One thing I have noticed with this chart is that the United States seems to have consumed the most amount of energy per capita compared to countries like China or the United Kingdom. What I found most surprising was the United States had its greatest energy consumption during 1973.")
)

plot_main2 <- mainPanel(
  plotlyOutput(outputId = "emission_plot"),
  p("")
)

graph_tab <- tabPanel(
  "Energy Consumption Viz",
  sidebarLayout(
    sidebar_plot,
    plot_main
  )
  )



my_vision_tab <- tabPanel(
  "Conclusion",
  p("This data visualization allowed me to understand how much energy we use in the United States as well as how much we use it in comparison to other countries. Reasonably though it could be due to the sheer population differences that might be a causing factor for the U.S. to have such large energy consumption. It was very interesting to see not even China was close to the U.S. even though I thought that population was determining factor. It proved me wrong and left me with even more questions to ask, but ultimately was very informative.")
)

ui <- navbarPage(
  "Climate Change",
  overview_tab,
  graph_tab,
  my_vision_tab
)