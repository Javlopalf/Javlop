from flask import Flask, request, jsonify
import numpy as np
import pickle as pkl
import json
  
endpoint = Flask(__name__)
endpoint.config["DEBUG"] = True


modelfile = 'C:\Users\lopez\OneDrive\Escritorio\CTBPush\TheBrigde2022\4-Productivizacion\1-Routing\ejercicios\ejercicio 2 Flask_API_retrain_db\linear-regresion.sav'
model = pkl.load(open(modelfile, 'rb'))
d_wines = {0: "tinto", 1: "blanco", 2: "rosado"}

@endpoint.route('/health', methods=['GET'])
def health():
    return "everything OK here"

@app.route('/score', methods=['POST'])
def makecalc():
    data = request.get_json().values()
    data = np.array(list(data)).reshape(1, -1)
    prediction = int(model.predict(data)[0])
    prediction = d_wines[prediction]
    return f'<h1>¿Cuál es mi vino favorito?</h1><p>Mi Vino favorito es el {prediction}</p>'

if __name__ == "__main__":
    print("hello")
    app.run(debug=False)


 
 


endpoint.run()

