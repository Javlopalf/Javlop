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

@video1.post("/Stores/<string:name>/items")
def create_item(name):
    request_data = request.get_json()
    for store in Stores:
      if store["Name"] == name:
          new_item = {"Name": request_data["name"], "price": request_data["price"]}
          store["items"].append(new_item)
          return new_item, 201
    return {"message": "Store not found"}, 404

@video1.get("/Stores/<string:name>")
def  get_stores2(name):
    for store in Stores:
        if store["Name"] == name:
            return store
    return {"message": "Store not found"}, 404
        
@video1.get("/Stores/<string:name>/item")
def  get_stores3(name):
    for store in Stores:
        if store["Name"] == name:
            return {"items": store["items"]}
    return {"message": "Store not found"}, 404

video1.run(port=5000)
