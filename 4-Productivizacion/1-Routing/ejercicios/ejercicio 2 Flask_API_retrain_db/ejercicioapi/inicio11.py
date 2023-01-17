from flask import Flask, request, jsonify
import numpy as np
import pickle as pkl
import json

inicio11 = Flask(__name__)
inicio11.config["DEBUG"] = True

modelfile = 'C:\\Users\\lopez\\OneDrive\\Escritorio\\CTBPush\\TheBrigde2022\\4-Productivizacion\\1-Routing\\ejercicios\\ejercicio 2 Flask_API_retrain_db\\linear-regresion.sav'
model = pkl.load(open(modelfile, 'rb'))
prediction = []

@inicio11.route('/score', methods=['POST'])
def makecalc():
    data11 = request.get_json()
    data11 = np.array(list(data11)).reshape(1, -1)
    prediction = int(model.predict(data11)[0])
    prediction = prediction[prediction]
    return data11
   

inicio11.run()