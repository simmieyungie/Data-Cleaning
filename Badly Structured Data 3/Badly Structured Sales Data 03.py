import pandas as pd
import xlrd

#read in dataset
df = pd.read_excel("3.-Badly-Structured-Sales-Data-3.xlsx", "Dirty 3", skiprows = [0])


#melt dataset
df1 = df.iloc[:,[0,1,2,3,4]].melt(id_vars = ["Unnamed: 0", "Segment"]).assign(Segment2 = "First Class")

df2 = df.iloc[:, [0,1,5,6,7]].melt(id_vars = ["Unnamed: 0", "Segment"]).assign(Segment2 = "Same Day")

df3 = df.iloc[:, [0,1,8,9,10]].melt(id_vars = ["Unnamed: 0", "Segment"]).assign(Segment2 = "Second Class")

df4 = df.iloc[:, [0,1,11,12,13]].melt(id_vars = ["Unnamed: 0", "Segment"]).assign(Segment2 = "Standard Class")

#Bind all dataframes
df5 = df1.append([df2,df3,df4]).dropna(how = "any")

#Examine column names
df5.columns
#rename colums
df5.columns = ["Order ID", "Order Date", "Segment", "Sales", "Ship Mode"]

#rearrange
df5 = df5[["Ship Mode", "Segment", "Order ID", "Order Date", "Sales"]]

#correct names in segment column
df5["Segment"].replace(".[1-5]","", regex = True, inplace = True)

df5.reset_index()
