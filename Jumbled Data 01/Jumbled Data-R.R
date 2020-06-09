df  <- X5_Jumbled_up_Customers_Details
df

#Libraries
library(tidyverse)

#Split for the names
name <- df %>% 
  separate(...1, into = c("name", "firstname", "secondname"), sep = " ") %>% 
  unite(name, 2:3, sep = " ")

#Extract the address column
address <- df %>% 
  separate(...1, into = c("address", "place"), sep = "Address") %>% 
  select(place) %>% 
  separate(place, into = c("address", "age"), sep = "Age") %>% 
  select(address)

#Extract the dender
age_gend <- df %>% 
  separate(...1, into = c("address", "place"), sep = "Address") %>% 
  select(place) %>% 
  separate(place, into = c("address", "age"), sep = "Age") %>% 
  select(age) %>% 
  separate(age, into = c("age", "gender"), sep = "Gender")

#bind all separated dataframes into a single entity
df_clean <- cbind.data.frame(name, address, age_gend)

write.csv(df_clean, "Cleaned.csv")
