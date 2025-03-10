
library(robotoolbox)

#Recuperation du token
token <- kobo_token(username = "ChristianCyriaque", password = "65WENDYAMKOBO", 
                    url = "https://kf.kobotoolbox.org")

kobo_setup(url = "https://kf.kobotoolbox.org", token = token)
kobo_settings() 

token


#Énumérer vos projets

library(robotoolbox)
library(dplyr)
asset_list <- kobo_asset_list()

asset_list |>
  slice_head(n = 5) |>
  knitr::kable()




#Recuperer les informations pour une enquetes données avec le uid

asset_list$uid
uid <- asset_list$uid[3]
asset <- kobo_asset(uid)
asset



#Recuperer les informations pour une enquetes données avec le nom de l'enquete

asset_ml<-asset_list |>
  filter(name == "Test1") |>
  pull(uid) |>
  kobo_asset()

asset_ml




#Afficher les données

data_ml <- kobo_data(asset_ml)

data_ml |>
  select(start:uuid) |>
  slice_head(n = 5) |>
  knitr::kable()


