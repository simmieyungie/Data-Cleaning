#Import pandas
import pandas as pd
import xlrd

#Load dataset
df = pd.read_excel("1.-Badly-Structured-Sales-Data-1.xlsx", "Dirty 1", skiprows = 1)

#Start the data cleaning process
df1 = df.iloc[:,0:6].melt(id_vars = "Ship Mode>>").assign(Segment = "Consumer")


df2 = df.iloc[:,[0,6,7,8,9,10]].melt(id_vars = "Ship Mode>>").assign(Segment = "Corporate")


df3 = df.iloc[:,[0,11,12,13,14,15]].melt(id_vars = "Ship Mode>>").assign(Segment = "Home Office")

df4 = df1.append([df2, df3]).dropna(subset = ["value"])

#Find all the variables needed. 
df4["variable"].unique()

#create a list of items to filter out
ls = ['First Class', 'Same Day', 'Second Class', 'Standard Class', 
      'First Class.1', 'Same Day.1', 'Second Class.1', 'Standard Class.1',
      'First Class.2', 'Second Class.2', 'Same Day.2', 'Standard Class.2']


#Filter out what we need
df4 = df4[df4["variable"].isin(ls)]#.to_csv("test.csv")
df4
#reset index levels and rearrange dataset
df4 = df4.iloc[:, [3, 1, 0 , 2]]

df4.reset_index(inplace = True)


#rename columns
df4.columns = ["index","Segment", "Ship Mode", "OrderID", "Sales"]

df4 

#remame rows in ship mode
df4["Ship Mode"].replace(".[1-3]", "", regex = True, inplace = True)


df4.to_csv("Cleaned1.csv")
