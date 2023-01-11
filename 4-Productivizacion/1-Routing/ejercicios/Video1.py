from flask import Flask, request

video1 = Flask(__name__)
video1.config['DEBUG'] = True

Stores = [ 
            {"Name": "My Store", 
            "items": [
            {
                "name": "Chair",
                "price": 15.99
              }
            ]
            }
]

@video1.get("/Stores")
def  get_stores():
    return {"Stores": Stores}

@video1.post("/Stores")
def create_store():
    request_data = request.get_json()
    new_store = {"Name": request_data["name"], "items":[]}
    Stores.append(new_store)
    return new_store, 201

video1.run(port=5000)
