---
    title: "Untitled"
output: 
    flexdashboard::flex_dashboard:
    orientation: columns
vertical_layout: fill
theme: cerulean
source_code: embed
---
    
    ```{r setup, include=FALSE}
library(flexdashboard)
```

Column {data-width=650}
-----------------------------------------------------------------------
    
    ### Chart A
    
    ```{r}


# Opções

knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)

# Bibliotecas e configurações

library(tidyverse)     # for data cleaning and plotting
library(leaflet)       # for highly customizable mapping

# Dados

# Starbucks locations

Starbucks <- read.csv("https://www.macalester.edu/~ajohns24/Data/Starbucks.csv") # leitura do arquivo de dados



leaflet() %>% addTiles() # chamando o mapa base

leaflet() %>% addTiles() %>% addCircleMarkers(data=Starbucks, lat = ~Latitude, lng = ~Longitude, radius = ~3) # plotando os pontos no mapa

Starbucks <- Starbucks %>% mutate(popup_info = paste ("Número da Loja", Store.Number, "<br/>", "Nome da Loja", Store.Name, "<br/>", "Cidade", City, "<br/>", "Estado", State.Province, "<br/>", "País", Country, "<br/>", "Telefone", Phone.Number)) # criando uma coluna na tabela de dados com os dados que serão mostrados na janela popup

leaflet() %>% addTiles() %>% addCircleMarkers(data=Starbucks, lat = ~Latitude, lng = ~Longitude, radius = ~3, popup = ~popup_info) # inserindo a janela popup no código

Starbucks$popup_info # checando os dados na coluna popup criada na tabela

colors <- c("brown", "yellow") # criando as cores para a palheta de cores

pal <-  colorFactor(colors, Starbucks$Timezone) # criando a palheta de cores e especificando a variável (coluna) da tabela que será usada para aplicaçação do gradiente de cores


leaflet() %>% addTiles() %>% addCircleMarkers(data=Starbucks, lat = ~Latitude, lng = ~Longitude, radius = ~3, popup = ~popup_info, color = ~pal(Timezone)) # código final incorporando o gradiente de cores

# Exluindo pontos de Estados Unidos, Canada e China para deixar o arquivo mais leve

Starbucks2 <- filter(Starbucks, Country != "US" & Country != "CA" & Country != "CN")

# Starbucks2 <- filter(Starbucks, Country == "BR")


# Mostrando o novo arquivo

leaflet() %>% addTiles() %>% addCircleMarkers(data=Starbucks2, lat = ~Latitude, lng = ~Longitude, radius = ~3, popup = ~popup_info, color = ~pal(Timezone)) # código final incorporando o gradiente de cores


```

Column {data-width=350}
-----------------------------------------------------------------------
    
    ### Chart B
    
    ```{r}

```

### Chart C

```{r}

```

