import pandas as pd


#load in the dataset
df = pd.read_csv(r"C:\Users\SIMIYOUNG\Desktop\R folder\Future of work\Automation\Data-Cleaning\Bad 2.csv", skiprows = [0])

#Column names
df.columns



#r.df2 = df.melt(id_vars="Segment").dropna(axis=0, how="any")

#df2["variable"].unique()
#melt the first class set
df1 = df.iloc[:, 0: 4].melt(id_vars = "Segment").assign(new = "First Class")
df1
#melt the same day day
df2 = df.iloc[:, [0, 4, 5, 6]].melt(id_vars = "Segment").assign(new = "Same Day")
df2

#Melt for Second class
df3 = df.iloc[:, [0, 7, 8, 9]].melt(id_vars = "Segment").assign(new = "Second Class")
df3

#Melt for Standard class
df4 = df.iloc[:, [0, 10, 11, 12]].melt(id_vars = "Segment").assign(new = "Standard Class")
df4
#Merge all data rows
df5 = df1.append([df2, df3, df4])

df5

#Drop all NA values
df6 = df5.dropna(axis=0, how="any")

#Reset index 
df6.reset_index(drop=True, inplace=True)
df6

df6["variable"].unique()
#Rename names in the variable column and give new column names
df6["variable"].replace(".[1-3]", "", regex = True, inplace = True)

#Change the names and rerrange columns
df6.columns = ["Order Date", "Segment", "Sales", "Ship Mode"]
\
df6 = df6[["Ship Mode", "Segment", "Order Date", "Sales"]]

#write file to csv
df6.to_csv("df6.csv")

