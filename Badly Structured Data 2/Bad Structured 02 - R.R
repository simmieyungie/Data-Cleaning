#Badly structured data two

library(tidyverse)
library(readxl)
#Read in dataset
df <- read_excel("2.-Badly-Structured-Sales-Data-2.xlsx")


df %>% 
  select(1:6) %>% 
  gather(2:6, key = "Ship Mode", value = "Sales") %>% 
  mutate(segment = "Consumer")
length(unique(a$`Ship Mode>>`))


 df %>% 
  select(1, 7:11) %>% 
  gather(2:6, key = "Ship Mode", value = "Sales") %>% 
  mutate(segment = "corporate")


df %>% 
  select(1, 12:16) %>% 
  gather(2:6, key = "Ship Mode", value = "Sales") %>% 
  mutate(segment = "home")
