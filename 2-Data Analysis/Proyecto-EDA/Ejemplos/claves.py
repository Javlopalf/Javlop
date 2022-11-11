import requests


 
privatekey = "3fc8c76abaa0e922101f354658ddced29209d0c3"
public_key = "2a61dbba3ff89b27eb84ae467f23caa4"
ts = 1
md5 = "13fc8c76abaa0e922101f354658ddced29209d0c32a61dbba3ff89b27eb84ae467f23caa4"



hashed = "398ab8a73a6e16561df5808b69ee48b7"
hashed_3 = "07e7e3f5eb06907e8a024c7c0a80725b"

url = f"https://gateway.marvel.com:443/v1/public/comics?ts={ts}&apikey={public_key}&hash={hashed}"



response = requests.get(url)

print(response)


