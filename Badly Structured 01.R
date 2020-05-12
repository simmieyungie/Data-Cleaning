#Load in the dataset.
df <- X1_Badly_Structured_Sales_Data_1


#The goal is to tidy the data and make it suitable for Analysis
#The Data and the Final Dataset is included in the sheet
library(tidyverse)

#there are three sections in the data as depicted in the excel sheet:
#Consumer
#Corporate
#Home

#My Approach; I selected the columns related to each section and the identifying ID
#I gather the data. Then the gather data were then column binded into a single data.
#To deal with the duplicate values. They were mainly repetitions evolving from the 
#Total column. I removed that row from the data and the final data was obtained

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
