import requests
import json
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import cross_val_score

url = 'http://127.0.0.1:5000'

data = pd.read_csv('C:\\Users\\lopez\\OneDrive\\Escritorio\\CTBPush\\TheBrigde2022\\4-Productivizacion\\1-Routing\\ejercicios\\ejercicio 2 Flask_API_retrain_db\\ejercicio\\Advertising.csv')

X = data[['TV', 'radio', 'newspaper']]
y = data[['sales']]
lin_reg = LinearRegression()
lin_reg.fit(X, y)

acc_cv = cross_val_score(lin_reg, X, y, cv=5)
print("Performance in CV 5 folds: {:.2%}+-{:.2%}".format(np.mean(acc_cv), np.std(acc_cv)))


data11 = cross_val_score(lin_reg, X, y, cv=5)

j_data = json.dumps(data11)

print(j_data)
print(type(j_data))
headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
r = requests.post(url, data11=j_data, headers=headers)



print(r)


