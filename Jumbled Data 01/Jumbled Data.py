import pandas as pd

df = pd.read_excel("5.-Jumbled-up-Customers-Details.xlsx", sep = "r", header = None)
df



#Get the name variables
#Split the data into four parts by space
df_name = df.iloc[:, 0].str.split(" ", n = 4, expand = True) 

#We now have the names splitted into indexes 1 and 2
df_name

#Join the names together into a single variable
names = df_name.iloc[:,[1,2]].apply(' '.join, axis=1)
names


#Get the address
#We spip the dataset by the Address column
df_add = df.iloc[:,0].str.split("Address", n = 5, expand = True) 

#The address column is in index 1, however, it is still joined with Age, so we split again 
#but by age this time
df_add = df_add.iloc[:,1].str.split("Age", n = 5, expand = True) 

#We now have the address at in 0, so we collect.
df_add
address = df_add.iloc[:, 0]
address


#Getting age
#From the earlier spiltted data for address, we have the and gender concatenated together in index 1
#Spltting by space the column at index one
df_age = df_add.iloc[:,1].str.split(" ", n = 3, expand = True)

#we noq have the age and gender at column index 1 and 3 individually
df_age

#Collect the age
age = df_age.iloc[:, 1]
age

#get gender
gender = df_age.iloc[:, 3]
gender

#Bind all results
df2 = pd.concat([names, address, age, gender], axis = 1)
df2

#rename dataframe
df2.columns = ["Names", "Address", "Age", "Gender"]

df2
