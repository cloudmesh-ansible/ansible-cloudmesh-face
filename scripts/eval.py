import matplotlib.pyplot as plt
import pandas as pd
import glob
import csv
import os

files = glob.glob ('~/ansible-cloudmesh-face/performance/*.csv')
print files

data = pd.DataFrame()

'''path = '/Users/Sonal/Desktop/sample'
dirList = os.listdir(path)
for dl in dirList:
     fullpath=os.path.join(path,dl)
     print fullpath	
     print dl'''


for file in files:

    df = pd.read_csv(file, sep=',')
    df['file'] = file
    data = pd.concat([data, df])


LABELS = ["real", "user", "sys"]

plt.title('Time Taken by Classifier')
plt.xlabel('Time_Types')
plt.ylabel('Time_Value in (sec)')


data.boxplot(by='file')

plt.show()

