

library(robotoolbox)
library(dplyr)
library(readr)

kobo_setup(url = "https://kf.kobotoolbox.org", 
           token = Sys.getenv('MY_TOKEN'))
kobo_settings() 





#Énumérer vos projets

asset_list <- kobo_asset_list()
asset_list |>
  slice_head(n = 5) |>
  knitr::kable()



#Recuperer les informations pour une enquetes données avec le uid


asset <- kobo_asset(Sys.getenv('MY_UID'))
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



# Enregistrer les données sous le format RDS

write_rds(data_ml, "mydf.rds")


