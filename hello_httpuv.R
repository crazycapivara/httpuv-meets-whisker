library(httpuv)

view <- paste0(
  "<html>",
  "<head><title>docker</title></head>",
  "<body><h1>docker it</h1></body>",
  "</html>"
)

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