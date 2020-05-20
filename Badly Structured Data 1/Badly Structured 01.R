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

library(reticulate)
c <- df %>% 
  select(1, 12:16) %>% 
  gather(2:6, key = "Ship Mode", value = "Sales") %>% 
  mutate(segment = "home")


#Bind all data together
d <- bind_rows(a,b,c)

#Drop NA values in the Sales data
e = d %>% 
  drop_na(Sales)

#Filter out the major rows
e <- e %>% 
  filter(`Ship Mode` %in% c("First Class...2", "Same Day...3", "Second Class...4", "Standard Class...5",
                          "First Class...7","Same Day...8", "Second Class...9", "Standard Class...10",
                          "First Class...12", "Same Day...13", "Second Class...14", "Standard Class...15"))

#Examine if there are duplicated columns
e[duplicated(e$`Ship Mode>>`),]


#Replace all the names correctly
#Using a str_detect with a replace function solves this problem
fnd <- e %>% 
  mutate(`Ship Mode` = replace(`Ship Mode`, str_detect(`Ship Mode`, "First Class"), "First Class")) %>% 
  mutate(`Ship Mode` = replace(`Ship Mode`, str_detect(`Ship Mode`, "Same Day"), "Same Day")) %>% 
  mutate(`Ship Mode` = replace(`Ship Mode`, str_detect(`Ship Mode`, "Second Class"), "Second Class")) %>% 
  mutate(`Ship Mode` = replace(`Ship Mode`, str_detect(`Ship Mode`, "Standard Class"), "Standard Class"))


#Change column names
names(fnd) <- c("Order ID", "Ship Mode", "Sales", "Segment")


#Rearrange columns 
fnd <- fnd %>% 
  select(4, 2, 1, 3)

write.csv(fnd, "Cleaned_Data_01.csv")


#PS: Don't mind my naming convention.. lol
