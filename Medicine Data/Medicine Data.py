import pandas as pd


#Load in dataset
df = pd.read_excel("7.-Medicine-Data-with-lumped-Quantity-and-Measure.xlsx")
df

#The goal

#Clean data

#Exrtact the measures
df["Measure"]  = df["Quantity"].str.extract('([A-Za-z]+)')

#Get the quantity
df["Quantity"] = df["Quantity"].str.replace('([A-Za-z]+)', '')

#Convert Quantity column to fload

df["Quantity"] = df["Quantity"].astype(float)

