#
df <- X7_Medicine_Data_with_lumped_Quantity_and_Measure


#library
library(tidyverse)

#Exract the needed values
df_clean <- df %>% 
  mutate(Measure = str_extract(Quantity, "([A-Za-z])+")) %>% 
  mutate(Quantity = as.numeric(str_replace(Quantity, "([A-Za-z])+", "")))

df_clean

#unique(df_clean$Quantity)
