library(httpuv)
library(whisker)
library(magrittr)

data <- list(
  header = "Hi folks",
  txt    = "So long, and thanks for all the fish."
)

view <- readLines("views/index.html") %>%
  whisker.render(data)

app <- list(
  call = function(req){
    list(
      status = 200L,
      headers = list('Content-Type' = 'text/html'),
      body = view
    )
  }
)

server <- runServer("127.0.0.1", 7700, app = app)