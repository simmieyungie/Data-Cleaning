#Load in the dataset.
df <- X1_Badly_Structured_Sales_Data_1


library(tidyverse)

a <- df %>% 
  select(1:6) %>% 
  gather(2:6, key = "Ship Mode", value = "Sales") %>% 
  mutate(segment = "Consumer")
length(unique(a$`Ship Mode>>`))


b <- df %>% 
  select(1, 7:11) %>% 
  gather(2:6, key = "Ship Mode", value = "Sales") %>% 
  mutate(segment = "corporate")


c <- df %>% 
  select(1, 12:16) %>% 
  gather(2:6, key = "Ship Mode", value = "Sales") %>% 
  mutate(segment = "home")



d <- bind_rows(a,b,c)

e = d %>% 
  drop_na(Sales)

#Filter out the major rows
e <- e %>% 
  filter(`Ship Mode` %in% c("First Class...2", "Same Day...3", "Second Class...4", "Standard Class...5",
                          "First Class...7","Same Day...8", "Second Class...9", "Standard Class...10",
                          "First Class...12", "Same Day...13", "Second Class...14", "Standard Class...15"))

#Examine if there are duplicated columns
e[duplicated(e$`Ship Mode>>`),]
