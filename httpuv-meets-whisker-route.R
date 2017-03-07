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
    route <- req$PATH_INFO
    print(route)
    body <- switch (route,
      "/secret" = "<pre>You found me.</pre>",
      "/folks"  = "<pre>So long ...</pre>",
      view
    )
    list(
      status = 200L,
      headers = list('Content-Type' = 'text/html'),
      body = body
    )
  }
)

server <- runServer("127.0.0.1", 7700, app = app)