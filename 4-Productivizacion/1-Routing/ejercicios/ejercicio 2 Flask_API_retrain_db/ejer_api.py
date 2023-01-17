'''
En este script se cargan los datos y entrena el modelo
'''
import pandas as pd
import numpy as np
from sklearn.model_selection import cross_val_score
from sklearn.linear_model import LinearRegression
import pickle
data = pd.read_csv('C:\\Users\\lopez\\OneDrive\\Escritorio\\CTBPush\\TheBrigde2022\\4-Productivizacion\\1-Routing\\ejercicios\\ejercicio 2 Flask_API_retrain_db\\ejercicio\\Advertising.csv')

X = data[['TV', 'radio', 'newspaper']]
y = data[['sales']]
lin_reg = LinearRegression()
lin_reg.fit(X, y)

acc_cv = cross_val_score(lin_reg, X, y, cv=5)
print("Performance in CV 5 folds: {:.2%}+-{:.2%}".format(np.mean(acc_cv), np.std(acc_cv)))


data = cross_val_score(lin_reg, X, y, cv=5)



