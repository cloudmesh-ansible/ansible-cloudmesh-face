import csv
import numpy as np
import pandas
import matplotlib.pyplot as plt
df = pandas.read_csv('Comparer_time_results.csv', sep=',')

LABELS = ["real", "user", "sys"]

# plt.hist(df['real'], bins=5)
# plt.plot(df['timetype'],df['value'])

plt.title('Time Taken by Comparer')
plt.xlabel('Time_Types')
plt.ylabel('Time_Value in (sec)')
colors = ['r','g','b']
plt.bar(range(len(df['timetype'])), df['value'], align='center',width=0.9,color =colors)
plt.xticks(range(len(df['timetype'])),LABELS)

plt.show()
