# Get data from data source and perform EDA on this data
# Importing data with the help of pandas 
import pandas as pd
data = pd.read_csv('raw_data.csv') #check the data from data source
print(data)

# get free from the unknown data columns which are not usable
data = data.drop(['Unnamed: 9','Unnamed: 10','Unnamed: 11','Unnamed: 12','Unnamed: 13'],axis = 1)
print(data)

# Rename some columns for better performance on data
data = data.rename(columns={'iso_code': "code",'location': "country",'total_cases':"Totalcases",'total_deaths':"Totaldeath",
               'stringency_index': "si",'gdp_per_capita':"gdp",'human_development_index': "HDI"} )
print(data)

#Let's first work on null values 
print(data.isnull().sum())

# I got alot of null values from those columns that have datatype=number

# they are Essential because they represent the other columns values and as per total cases we will write so mainly means there are 0 as in the case of null value
# Zero the value. if there is any null value
data = data.fillna(0) 
print(data)
print(data.isnull().sum())
# I got rid from null values
# Lets check that how many times a country occur for the mean purpose
ctrycount = data['country'].value_counts()
print(ctrycount)

# we don't have a equall number of coutries in the datset
# Let's check the mode
ctrycount = data['country'].value_counts().mode()
print(ctrycount)

# So the mode is 294 so lets  We will need to use it for dividing the sum of all the samples related to the 
# human development index, GDP per capita, and the population
code = data['code'].unique().tolist()
country=data['country'].unique().tolist()
hdi = []
tc = []
td = []
sti = []
population = data['population'].unique().tolist()
gdp = []

for i in country:
    hdi.append((data.loc[data['country']==i,'HDI']).sum()/294)
    tc.append((data.loc[data['country']==i,'Totalcases']).sum())
    td.append((data.loc[data['country']==i,'Totaldeath']).sum())
    sti.append((data.loc[data['country']==i,'si']).sum()/294)
    population.append((data.loc[data['country']==i,'population']).sum()/294)

aggregated_data = pd.DataFrame(list(zip(code,country,hdi,tc,td,sti,population)),
                              columns =['code','country','Totalcases','Totaldeath',
                                        'si','HDI','population'])
print(aggregated_data)
# we get all over average for dataset and we can't conclude gdp per capita 
# Let's select a subsample of this dataset, i will select top 10 countries with highest covid cases
countrycase = data.groupby('country')['Totalcases'].max().nlargest(10)
print(countrycase)

# create a list as per their index of the countries
cotry = countrycase.index.tolist()
print(cotry)

# plot the graph 
import matplotlib.pyplot as plt
plt.bar(cotry,countrycase)
plt.title('Top 10 country cases',fontsize=20,fontweight=20)
plt.show()

# Lets select the data that have only number columns
dp = aggregated_data.select_dtypes('number')
print(dp.columns)

# creating a boxplot chart for check the outliers 
# import matplotlib.pyplot as plt
import seaborn as sns
sns.boxplot(x=aggregated_data['Totalcases'])
plt.show()
# # Lets check the distribution of the data
# Q1 = dp.quantile(0.25)   
# Q3 = dp.quantile(0.75)
# IQR = Q3-Q1
# print(IQR)
 
# # Remove these Quartiles from the data.
# dp = dp[~((dp<(Q1-1.5*IQR))|(dp>(Q3+1.5*IQR))).any(axis = 1)]
# print(dp.shape)
# sns.kdeplot(data=dp['Totalcases'])
# plt.show()

# Convert data columns values with quantile removed data
# aggregated_data['Totalcases']=dp['Totalcases']
# aggregated_data['Totaldeath']=dp['Totaldeath']
# aggregated_data['si']=dp['si']
# aggregated_data['HDI']=dp['HDI']
# aggregated_data['population']=dp['population']
print(aggregated_data)
# check the null values
print(aggregated_data.isnull().sum())
# converting null values
aggregated_data = aggregated_data.fillna(0)
print(aggregated_data.isnull().sum())   #Recheck
 
# check the quartiles
sns.boxplot(x=aggregated_data['Totalcases'])
plt.show()

# for creating it we have to grouped the data for take single country
tcs= data.groupby('country')['Totalcases'].sum().nlargest(20)
print(tcs)

# Creating a list to take countries names
country_names = tcs.index.tolist()
print(country_names)

# Plotting this cleaned data for  for visualiztion
# creating a pie chart for each top 10 countries total_cases
import matplotlib.pyplot as plt
plt.pie(tcs,labels=country_names,autopct='%1.1f%%',shadow=True,startangle=60)
plt.title('Top 20 country cases',color='red',fontsize=15,fontweight='bold')
plt.show()

#creating a line chart for bottom 10 countries 


tcs= data.groupby('country')['Totalcases'].sum().nsmallest(20)
print(tcs)
# Creating a list to take countries names
country_names = tcs.index.tolist()
print(country_names)
# plotting for this case
import matplotlib.pyplot as plt
plt.plot(tcs,country_names)
plt.title('bottom 20 country cases',color='red',fontsize=15,fontweight='bold')
plt.show()

# group data with their population from the data
contry = data.groupby('country')['Totaldeath'].max().nlargest(10)
print(contry)
# create a list for country
country_name = contry.index.tolist()
# import numpy as np
# plot the graph
plt.pie(contry,labels=country_name,autopct='%1.1f%%',shadow=True,startangle=40)
plt.title('Total death in Countries')
plt.show()


# # plotting a normal distribution chart to check the distribution of the data
# import seaborn as sns
# import matplotlib.pyplot as plt
# sns.kdeplot(data=data['Totalcases'])
# plt.show()

# plotting multiple graph of countries with Totalcases,TOtaldeath,si,HDI,population
Totalcase = data.groupby('country')['Totalcases'].sum().nlargest(5)
Totalcasescountry = Totalcase.index.tolist()
print(Totalcase)
print(Totalcasescountry)
# si
countsi = data.groupby('country')['si'].sum().nlargest(5)
sicountry = countsi.index.tolist()
print(countsi)
print(sicountry)
# HDI
HDIcount = data.groupby('country')['HDI'].sum().nlargest(5)
HDIcountry = HDIcount.index.tolist()
print(HDIcount)
print(HDIcountry)
# Population
popucount = data.groupby('country')['population'].max().nlargest(10)
countrypop = popucount.index.tolist()
print(popucount)
print(countrypop)
# plotting the graph
plt.bar(sicountry,countsi)
plt.title('Max Stringency index country',fontsize='20',fontweight='20')
plt.show()
plt.plot(HDIcountry,HDIcount)
plt.title('Max Human development index',fontsize='20',fontweight='20')
plt.show()
plt.pie(popucount,labels=countrypop,autopct='%0.1f%%',startangle=90)
plt.title('Max population countries',fontsize='20',fontweight='20')
plt.show()

# plot the bar that have max population with their total cases 
plt.bar(countrypop,popucount)
plt.legend(Totalcasescountry)
plt.show()

# check the death rate of the total death as per the total cases
death_rate = (data['Totaldeath'].sum()/data['Totalcases'].sum())*100
print("death rate",death_rate)

# find date wise cases of top 10 
datecase = data.groupby('date')['Totalcases'].sum().nlargest(60)
print(datecase)
# create a list for the date that specified
date = datecase.index.tolist()

# plotting the data
plt.plot(datecase,date)
plt.title('Increase of cases all over the world')
plt.yticks(fontsize=6,fontweight=6)
plt.xticks(fontsize=6,fontweight=6)
plt.show()


# Finding the total death of the data with date
datedeathcase = data.groupby('date')['Totaldeath'].sum().nlargest(60)
print(datedeathcase)
# create a list for the date that specified
date = datedeathcase.index.tolist()

# plotting the data
plt.plot(datedeathcase,date)
plt.title('Increase of deaths all over the world')
plt.yticks(fontsize=6,fontweight=6)
plt.xticks(fontsize=6,fontweight=6)
plt.show()

# let's check the data date year with total cases
print(data)
# split date column
data[['Year','Month','daydate']]=data['date'].str.split('-',expand=True)
print(data)

# Here we get the year separately now let's create a group
Monthcases = data.groupby('Month')['Totalcases'].sum()
print(Monthcases)

# Listing the year
Month= Monthcases.index.tolist()

# Plotting the pie chart
plt.bar(Month,Monthcases)
plt.show()

#Total cases with total death nlargest 10
totalcase = data.groupby('country')['Totalcases'].sum().nlargest(60)
# take index from it
country=totalcase.index.tolist()

#finding total death cases country wise
totaldeathcase = data.groupby('country')['Totaldeath'].sum().nlargest(100)
# take index from it and add in list
totaldeath=totaldeathcase.index.tolist()
# Scatter chart for country cases with deaths0
plt.scatter(x=country,y=totalcase,c='b')
plt.xticks(rotation=80)
plt.show()

